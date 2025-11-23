#!/usr/bin/env python3
"""
Realtime Firestore -> AWS Kinesis listener.
"""

from __future__ import annotations

import json
import logging
import os
import random
import signal
import sys
import threading
import time
from concurrent.futures import ThreadPoolExecutor
from typing import Any, Optional

from dotenv import load_dotenv

load_dotenv()

SERVICE_ACCOUNT_FILE = os.getenv("SERVICE_ACCOUNT_FILE")
FIRESTORE_COLLECTION = os.getenv("FIRESTORE_COLLECTION")
KINESIS_STREAM = os.getenv("KINESIS_STREAM")

AWS_ACCESS_KEY_ID = os.getenv("AWS_ACCESS_KEY_ID")
AWS_SECRET_ACCESS_KEY = os.getenv("AWS_SECRET_ACCESS_KEY")
AWS_REGION = os.getenv("AWS_DEFAULT_REGION") or os.getenv("AWS_REGION") or "us-east-1"

MAX_WORKERS = 10
MAX_RETRIES = 6
BASE_BACKOFF = 0.5

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)],
)
logger = logging.getLogger("listener")

missing_required = [
    key
    for key, val in {
        "SERVICE_ACCOUNT_FILE": SERVICE_ACCOUNT_FILE,
        "FIRESTORE_COLLECTION": FIRESTORE_COLLECTION,
        "KINESIS_STREAM": KINESIS_STREAM,
        "AWS_ACCESS_KEY_ID": AWS_ACCESS_KEY_ID,
        "AWS_SECRET_ACCESS_KEY": AWS_SECRET_ACCESS_KEY,
    }.items()
    if not val
]
if missing_required:
    logger.error("Missing required environment variables: %s", ", ".join(missing_required))
    sys.exit(2)

import boto3
from botocore.exceptions import BotoCoreError, ClientError, EndpointConnectionError

import firebase_admin
from firebase_admin import credentials, firestore

try:
    cred = credentials.Certificate(SERVICE_ACCOUNT_FILE)
    firebase_admin.initialize_app(cred)
    db = firestore.client()
    logger.info("Initialized Firestore client with service account file: %s", SERVICE_ACCOUNT_FILE)
except Exception as exc:
    logger.error("Failed to initialize Firestore Admin SDK: %s", exc, exc_info=True)
    raise

try:
    kinesis_client = boto3.client(
        "kinesis",
        region_name=AWS_REGION,
        aws_access_key_id=AWS_ACCESS_KEY_ID,
        aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
    )
    logger.info("Initialized Kinesis client (region=%s)", AWS_REGION)
except Exception as exc:
    logger.error("Failed to initialize boto3 Kinesis client: %s", exc, exc_info=True)
    raise

executor = ThreadPoolExecutor(max_workers=MAX_WORKERS)
shutdown_event = threading.Event()
watch_handle: Optional[Any] = None
startup_ts = int(time.time() * 1000)


def _json_default(obj: Any) -> Any:
    """Fallback serializer for Firestore-specific types."""
    try:
        import datetime
        from google.cloud.firestore_v1 import _helpers as _fh
        from google.cloud.firestore_v1.document import DocumentReference
    except Exception:
        datetime = None
        _fh = None
        DocumentReference = None

    if datetime and isinstance(obj, datetime.datetime):
        return obj.isoformat()

    try:
        if DocumentReference and isinstance(obj, DocumentReference):
            return obj.path
    except Exception:
        pass

    try:
        if _fh and hasattr(_fh, "GeoPoint") and isinstance(obj, _fh.GeoPoint):
            return {"latitude": obj.latitude, "longitude": obj.longitude}
    except Exception:
        pass

    try:
        if isinstance(obj, (bytes, bytearray)):
            return obj.decode("utf-8", errors="ignore")
    except Exception:
        pass

    try:
        from decimal import Decimal

        if isinstance(obj, Decimal):
            return float(obj)
    except Exception:
        pass

    try:
        return str(obj)
    except Exception:
        return None


def send_to_kinesis_with_retries(stream_name: str, partition_key: str, data_bytes: bytes) -> None:
    attempt = 0
    while attempt < MAX_RETRIES and not shutdown_event.is_set():
        try:
            kinesis_client.put_record(StreamName=stream_name, Data=data_bytes, PartitionKey=partition_key)
            logger.info(
                "Sent record to Kinesis stream=%s partition_key=%s size=%d",
                stream_name,
                partition_key,
                len(data_bytes),
            )
            return
        except (ClientError, EndpointConnectionError, BotoCoreError, Exception) as err:
            attempt += 1
            backoff = BASE_BACKOFF * (2 ** (attempt - 1))
            jitter = backoff * (0.5 + random.random() * 0.5)
            logger.error(
                "Kinesis put_record failed (attempt %d/%d) for id=%s: %s. Retrying in %.2fs",
                attempt,
                MAX_RETRIES,
                partition_key,
                err,
                jitter,
            )
            time.sleep(jitter)
    logger.error("Exceeded max retries (%d) sending id=%s to Kinesis stream=%s", MAX_RETRIES, partition_key, stream_name)


def process_new_doc(doc_snapshot: firestore.DocumentSnapshot) -> None:
    try:
        data = doc_snapshot.to_dict() or {}
        data["id"] = doc_snapshot.id

        json_str = json.dumps(data, default=_json_default, ensure_ascii=False)
        payload = json_str.encode("utf-8")

        send_to_kinesis_with_retries(KINESIS_STREAM, doc_snapshot.id, payload)
    except Exception as exc:
        logger.exception("Failed to process document id=%s: %s", getattr(doc_snapshot, "id", "<unknown>"), exc)


def on_collection_snapshot(col_snapshot, changes, read_time):
    """Firestore on_snapshot callback."""
    try:
        if shutdown_event.is_set():
            return

        for change in changes:
            ctype = getattr(change, "type", None)
            if getattr(ctype, "name", None) == "ADDED":
                doc = change.document
                executor.submit(process_new_doc, doc)
    except Exception:
        logger.exception("Error in Firestore snapshot callback")


def start_listener() -> None:
    global watch_handle
    collection_ref = db.collection(FIRESTORE_COLLECTION)
    query = collection_ref.where("timestamp", ">", startup_ts)
    logger.info("Attaching listener to collection=%s with timestamp filter > %d", FIRESTORE_COLLECTION, startup_ts)
    watch_handle = query.on_snapshot(on_collection_snapshot, on_error=on_watch_error)
    logger.info("Listener attached successfully")


def on_watch_error(error: Exception):
    """Handle Firestore watch errors by logging and reattaching."""
    logger.error("Firestore watch error: %s", error, exc_info=True)
    if shutdown_event.is_set():
        return
    backoff = BASE_BACKOFF
    while not shutdown_event.is_set():
        try:
            start_listener()
            logger.info("Reattached Firestore listener after error")
            return
        except Exception as exc:
            logger.error("Failed to reattach listener: %s", exc, exc_info=True)
            time.sleep(backoff)
            backoff = min(backoff * 2, 60)


def _stop(signum=None, frame=None):
    logger.info("Shutdown signal received: %s", signum)
    shutdown_event.set()

    try:
        if watch_handle:
            watch_handle.unsubscribe()
            logger.info("Unsubscribed Firestore listener")
    except Exception:
        logger.exception("Error unsubscribing Firestore listener")

    logger.info("Shutting down worker pool (waiting for running tasks)...")
    try:
        executor.shutdown(wait=True)
    except Exception:
        logger.exception("Error shutting down executor")

    try:
        if hasattr(kinesis_client, "close"):
            kinesis_client.close()
    except Exception:
        pass

    logger.info("Shutdown complete.")
    try:
        sys.exit(0)
    except SystemExit:
        os._exit(0)


def main():
    signal.signal(signal.SIGINT, _stop)
    signal.signal(signal.SIGTERM, _stop)

    start_listener()

    try:
        while not shutdown_event.is_set():
            time.sleep(0.5)
    except KeyboardInterrupt:
        _stop()


if __name__ == "__main__":
    main()

import json
import logging
import os
import threading
from datetime import datetime, timezone
from typing import Any, Dict

import boto3
from botocore.exceptions import BotoCoreError, ClientError
from dotenv import load_dotenv
import firebase_admin
from firebase_admin import credentials, firestore


def _load_config() -> Dict[str, str]:
    load_dotenv()

    config = {
        "service_account_file": (os.getenv("SERVICE_ACCOUNT_FILE") or "").strip(),
        "firestore_collection": (os.getenv("FIRESTORE_COLLECTION") or "").strip(),
        "kinesis_stream": (os.getenv("KINESIS_STREAM") or "").strip(),
        "aws_region": (os.getenv("AWS_DEFAULT_REGION") or "").strip(),
        "query_scope": (os.getenv("FIRESTORE_QUERY_SCOPE", "group") or "group").strip().lower(),
        "parent_collection": (os.getenv("FIRESTORE_PARENT_COLLECTION") or "").strip(),
        "debug_listener": (os.getenv("DEBUG_FIRESTORE_LISTENER") or "").lower() in ("1", "true", "yes"),
    }

    missing = [key for key, value in config.items() if not value]
    if missing:
        raise RuntimeError(f"Missing required environment variables: {', '.join(missing)}")

    if config["query_scope"] not in ("group", "collection"):
        raise RuntimeError("FIRESTORE_QUERY_SCOPE must be 'group' or 'collection'")

    return config


def _to_json_ready(value: Any) -> Any:
    if isinstance(value, dict):
        return {k: _to_json_ready(v) for k, v in value.items()}
    if isinstance(value, list):
        return [_to_json_ready(v) for v in value]
    if hasattr(value, "isoformat"):
        return value.isoformat()
    return value


def _extract_parent_id(path: str, parent_collection: str) -> str | None:
    parts = path.split("/")
    for i, part in enumerate(parts):
        if part == parent_collection and i + 1 < len(parts):
            return parts[i + 1]
    return None


def _publish_firebase_received_metric(cloudwatch_client: Any) -> None:
    try:
        cloudwatch_client.put_metric_data(
            Namespace="PipelineMetrics",
            MetricData=[
                {
                    "MetricName": "FirebaseReceived",
                    "Dimensions": [{"Name": "Stage", "Value": "Listener"}],
                    "Value": 1,
                    "Unit": "Count",
                }
            ],
        )
    except (ClientError, BotoCoreError):
        logging.exception("Failed to publish FirebaseReceived metric")


def _publish_kinesis_pushed_metric(cloudwatch_client: Any) -> None:
    try:
        cloudwatch_client.put_metric_data(
            Namespace="PipelineMetrics",
            MetricData=[
                {
                    "MetricName": "KinesisPushed",
                    "Dimensions": [{"Name": "Stage", "Value": "Kinesis"}],
                    "Value": 1,
                    "Unit": "Count",
                }
            ],
        )
    except (ClientError, BotoCoreError):
        logging.exception("Failed to publish KinesisPushed metric")


def _publish_user_added_metric(cloudwatch_client: Any) -> None:
    try:
        cloudwatch_client.put_metric_data(
            Namespace="PipelineMetrics",
            MetricData=[
                {
                    "MetricName": "UsersAdded",
                    "Dimensions": [{"Name": "Stage", "Value": "Listener"}],
                    "Value": 1,
                    "Unit": "Count",
                }
            ],
        )
    except (ClientError, BotoCoreError):
        logging.exception("Failed to publish UsersAdded metric")


def main() -> None:
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s %(levelname)s %(message)s",
    )

    config = _load_config()

    logging.info("Initializing Firebase with %s", config["service_account_file"])
    cred = credentials.Certificate(config["service_account_file"])
    firebase_admin.initialize_app(cred)
    db = firestore.client()

    cloudwatch = boto3.client("cloudwatch", region_name="us-east-1")

    logging.info("Initializing Kinesis client for stream %s", config["kinesis_stream"])
    kinesis = boto3.client("kinesis", region_name=config["aws_region"])

    start_cutoff = datetime.now(timezone.utc)

    if config["query_scope"] == "group":
        collection = db.collection_group(config["firestore_collection"])
        scope_desc = "collection group"
    else:
        collection = db.collection(config["firestore_collection"])
        scope_desc = "collection"

    seen_user_ids: set[str] = set()
    seen_lock = threading.Lock()

    def on_snapshot(query_snapshot, changes, read_time) -> None:
        if config["debug_listener"]:
            logging.info(
                "Snapshot received: %d changes at %s",
                len(changes),
                read_time.isoformat() if read_time else "unknown",
            )
        for change in changes:
            if change.type.name not in ("ADDED", "MODIFIED"):
                continue

            doc = change.document
            if config.get("parent_collection"):
                marker = f"{config['parent_collection']}/"
                if not doc.reference.path.startswith(marker):
                    if config["debug_listener"]:
                        logging.info(
                            "Skipping %s due to parent filter (expected prefix %s)",
                            doc.reference.path,
                            marker,
                        )
                    continue

            doc_data = doc.to_dict() or {}
            user_id = doc_data.get("userId")
            if not user_id and config.get("parent_collection"):
                user_id = _extract_parent_id(doc.reference.path, config["parent_collection"])

            # Skip historical docs present at startup; only forward new/updated after listener began.
            latest_write = doc.update_time or doc.create_time
            if latest_write and latest_write < start_cutoff:
                if config["debug_listener"]:
                    logging.info(
                        "Skipping %s written at %s before listener start %s",
                        doc.reference.path,
                        latest_write.isoformat(),
                        start_cutoff.isoformat(),
                    )
                continue

            data = {
                "event": change.type.name.lower(),
                "collection": config["firestore_collection"],
                "query_scope": config["query_scope"],
                "parent_collection": config["parent_collection"] or None,
                "document_id": doc.id,
                "document_path": doc.reference.path,
                "user_id": user_id,
                "data": _to_json_ready(doc_data),
                "read_time": read_time.isoformat() if read_time else None,
                "create_time": doc.create_time.isoformat() if doc.create_time else None,
                "update_time": doc.update_time.isoformat() if doc.update_time else None,
            }

            try:
                payload = json.dumps(data, default=str)
                kinesis.put_record(
                    StreamName=config["kinesis_stream"],
                    Data=payload,
                    PartitionKey=doc.id,
                )
                _publish_firebase_received_metric(cloudwatch)
                _publish_kinesis_pushed_metric(cloudwatch)
                if user_id:
                    # Count a user the first time we see any change for them after startup,
                    # regardless of whether the snapshot reports ADDED or MODIFIED.
                    with seen_lock:
                        first_seen = user_id not in seen_user_ids
                        if first_seen:
                            seen_user_ids.add(user_id)
                    if first_seen:
                        _publish_user_added_metric(cloudwatch)
                logging.info(
                    "Sent %s change for %s to Kinesis (scope=%s, parent=%s)",
                    change.type.name,
                    doc.reference.path,
                    config["query_scope"],
                    config["parent_collection"] or "none",
                )
            except (ClientError, BotoCoreError):
                logging.exception("Failed to push change for %s to Kinesis", doc.reference.path)

    logging.info(
        "Starting listener on %s '%s' (parent filter: %s)",
        scope_desc,
        config["firestore_collection"],
        config["parent_collection"] or "none",
    )
    watch = collection.on_snapshot(on_snapshot)

    logging.info("Listener registered; waiting for Firestore updates...")

    stop_event = threading.Event()
    try:
        while not stop_event.wait(60):
            pass
    except KeyboardInterrupt:
        logging.info("Stopping listener...")
    finally:
        watch.unsubscribe()
        logging.info("Listener stopped.")


if __name__ == "__main__":
    main()

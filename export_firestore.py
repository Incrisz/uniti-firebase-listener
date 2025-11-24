#!/usr/bin/env python3
"""Export all documents in a Firestore collection to a JSON file."""

from __future__ import annotations

import json
import logging
import os
import sys
from typing import Any

from dotenv import load_dotenv
from firebase_admin import credentials, firestore, initialize_app

load_dotenv()

SERVICE_ACCOUNT_FILE = os.getenv("SERVICE_ACCOUNT_FILE")
FIRESTORE_COLLECTION = os.getenv("FIRESTORE_COLLECTION")
OUTPUT_FILE = os.getenv("OUTPUT_FILE") or "firestore_export.json"
EXPORT_LIMIT = int(os.getenv("EXPORT_LIMIT", "0"))  # 0 means no limit

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)],
)
logger = logging.getLogger("firestore_export")


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


def validate_config() -> None:
    missing = [key for key, val in {"SERVICE_ACCOUNT_FILE": SERVICE_ACCOUNT_FILE, "FIRESTORE_COLLECTION": FIRESTORE_COLLECTION}.items() if not val]
    if missing:
        logger.error("Missing required environment variables: %s", ", ".join(missing))
        sys.exit(2)


def export_collection() -> None:
    cred = credentials.Certificate(SERVICE_ACCOUNT_FILE)
    initialize_app(cred)
    db = firestore.client()
    logger.info("Exporting collection '%s' to %s", FIRESTORE_COLLECTION, OUTPUT_FILE)

    docs = []
    try:
        query = db.collection(FIRESTORE_COLLECTION)
        if EXPORT_LIMIT > 0:
            query = query.limit(EXPORT_LIMIT)
        for doc in query.stream():
            data = doc.to_dict() or {}
            data["id"] = doc.id
            docs.append(data)
    except Exception as exc:
        logger.error("Failed to read collection: %s", exc, exc_info=True)
        sys.exit(1)

    try:
        with open(OUTPUT_FILE, "w", encoding="utf-8") as outfile:
            json.dump(docs, outfile, default=_json_default, ensure_ascii=False, indent=2)
    except Exception as exc:
        logger.error("Failed to write export file: %s", exc, exc_info=True)
        sys.exit(1)

    logger.info("Export complete. %d documents written to %s", len(docs), OUTPUT_FILE)


def main() -> None:
    validate_config()
    export_collection()


if __name__ == "__main__":
    main()

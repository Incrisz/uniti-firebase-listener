#!/usr/bin/env python3
"""Import documents from a JSON export into a Firestore collection using document IDs."""

from __future__ import annotations

import json
import logging
import os
import sys
from typing import Any, Dict, Iterable, List, Tuple

from dotenv import load_dotenv
from firebase_admin import credentials, firestore, initialize_app

load_dotenv()

SERVICE_ACCOUNT_FILE = os.getenv("SERVICE_ACCOUNT_FILE")
FIRESTORE_COLLECTION = os.getenv("FIRESTORE_COLLECTION")
INPUT_FILE = os.getenv("INPUT_FILE") or "firestore_export.json"
BATCH_SIZE = int(os.getenv("FIRESTORE_BATCH_SIZE", "400"))  # Firestore limit is 500; keep under to be safe.

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)],
)
logger = logging.getLogger("firestore_import")


def validate_config() -> None:
    missing = [key for key, val in {"SERVICE_ACCOUNT_FILE": SERVICE_ACCOUNT_FILE, "FIRESTORE_COLLECTION": FIRESTORE_COLLECTION}.items() if not val]
    if missing:
        logger.error("Missing required environment variables: %s", ", ".join(missing))
        sys.exit(2)

    if not os.path.exists(INPUT_FILE):
        logger.error("Input JSON file not found: %s", INPUT_FILE)
        sys.exit(2)


def load_documents() -> List[Tuple[str, Dict[str, Any]]]:
    """Load JSON content into (id, data) tuples."""
    try:
        with open(INPUT_FILE, "r", encoding="utf-8") as infile:
            payload = json.load(infile)
    except Exception as exc:
        logger.error("Failed to read JSON file: %s", exc, exc_info=True)
        sys.exit(1)

    docs: List[Tuple[str, Dict[str, Any]]] = []

    if isinstance(payload, list):
        for idx, item in enumerate(payload):
            if not isinstance(item, dict) or "id" not in item:
                logger.error("Item %d is missing 'id' or not an object", idx)
                sys.exit(1)
            doc_id = str(item["id"])
            data = {k: v for k, v in item.items() if k != "id"}
            docs.append((doc_id, data))
    elif isinstance(payload, dict):
        # Accept an object map of {id: data}
        for doc_id, data in payload.items():
            if not isinstance(data, dict):
                logger.error("Document %s payload is not an object", doc_id)
                sys.exit(1)
            docs.append((str(doc_id), data))
    else:
        logger.error("Unsupported JSON structure; expected list or object at top level.")
        sys.exit(1)

    if not docs:
        logger.warning("No documents found to import.")
    else:
        logger.info("Loaded %d documents from %s", len(docs), INPUT_FILE)
    return docs


def chunks(items: Iterable[Tuple[str, Dict[str, Any]]], size: int) -> Iterable[List[Tuple[str, Dict[str, Any]]]]:
    batch: List[Tuple[str, Dict[str, Any]]] = []
    for item in items:
        batch.append(item)
        if len(batch) >= size:
            yield batch
            batch = []
    if batch:
        yield batch


def import_documents(docs: List[Tuple[str, Dict[str, Any]]]) -> None:
    cred = credentials.Certificate(SERVICE_ACCOUNT_FILE)
    initialize_app(cred)
    db = firestore.client()

    imported = 0
    for batch_docs in chunks(docs, BATCH_SIZE):
        batch = db.batch()
        for doc_id, data in batch_docs:
            doc_ref = db.collection(FIRESTORE_COLLECTION).document(doc_id)
            batch.set(doc_ref, data)
        try:
            batch.commit()
        except Exception as exc:
            logger.error("Failed to commit batch at offset %d: %s", imported, exc, exc_info=True)
            sys.exit(1)
        imported += len(batch_docs)
        logger.info("Imported %d/%d documents so far", imported, len(docs))

    logger.info("Import complete. %d documents written to collection '%s'.", imported, FIRESTORE_COLLECTION)


def main() -> None:
    validate_config()
    documents = load_documents()
    if documents:
        import_documents(documents)


if __name__ == "__main__":
    main()

import argparse
import logging
import os
import uuid
from datetime import datetime, timezone
from typing import Any, Dict, Iterable, List

from dotenv import load_dotenv
import firebase_admin
from firebase_admin import credentials, firestore
from google.cloud.firestore_v1 import FieldFilter

BATCH_WRITE_LIMIT = 450  # stay below Firestore 500 op limit per batch


def _load_config() -> Dict[str, str]:
    load_dotenv()
    config = {
        "service_account_file": (os.getenv("SERVICE_ACCOUNT_FILE") or "").strip(),
        "parent_collection": (os.getenv("FIRESTORE_PARENT_COLLECTION") or "app_usage_events").strip(),
        "sub_collection": (os.getenv("FIRESTORE_COLLECTION") or "events").strip(),
    }
    missing = [k for k, v in config.items() if not v]
    if missing:
        raise RuntimeError(f"Missing required environment variables: {', '.join(missing)}")
    return config


def _init_firestore(config: Dict[str, str]) -> firestore.Client:
    if not firebase_admin._apps:
        cred = credentials.Certificate(config["service_account_file"])
        firebase_admin.initialize_app(cred)
    return firestore.client()


def build_sample_data(user_id: str, event_id: str, batch_id: str) -> Dict[str, Any]:
    now = datetime.now(timezone.utc).isoformat()
    return {
        "eventType": "TEST_EVENT",
        "message": "listener test",
        "userId": user_id,
        "sessionId": str(uuid.uuid4()),
        "deviceModel": "test-device",
        "androidVersion": "test",
        "createdAt": now,
        "updatedAt": now,
        "rank": 0,
        "totalTimeInForeground": 0,
        "totalTimeInForegroundMs": 0,
        "totalTimeInForegroundMinutes": 0,
        "eventId": event_id,
        "testBatchId": batch_id,
    }


def _chunked(items: Iterable[Any], size: int) -> Iterable[List[Any]]:
    chunk: List[Any] = []
    for item in items:
        chunk.append(item)
        if len(chunk) == size:
            yield chunk
            chunk = []
    if chunk:
        yield chunk


def _commit_batch(batch: firestore.WriteBatch, op_count: int) -> int:
    if op_count > 0:
        batch.commit()
    return 0


def add_batch_test_data(db: firestore.Client, config: Dict[str, str], count: int, batch_id: str) -> None:
    logging.info(
        "Creating %s users with 1 event each in %s/<userId>/%s using batch id %s",
        count,
        config["parent_collection"],
        config["sub_collection"],
        batch_id,
    )

    batch = db.batch()
    ops_in_batch = 0
    created_paths: List[str] = []

    for _ in range(count):
        user_id = str(uuid.uuid4())
        event_id = str(uuid.uuid4())

        parent_ref = db.collection(config["parent_collection"]).document(user_id)
        event_ref = parent_ref.collection(config["sub_collection"]).document(event_id)

        parent_payload = {
            "userId": user_id,
            "testBatchId": batch_id,
            "createdAt": datetime.now(timezone.utc).isoformat(),
        }

        batch.set(parent_ref, parent_payload, merge=True)
        batch.set(event_ref, build_sample_data(user_id, event_id, batch_id))
        created_paths.append(event_ref.path)

        ops_in_batch += 2
        if ops_in_batch >= BATCH_WRITE_LIMIT:
            ops_in_batch = _commit_batch(batch, ops_in_batch)
            batch = db.batch()

    _commit_batch(batch, ops_in_batch)
    logging.info("Created %s documents with batch id %s", len(created_paths), batch_id)


def _delete_documents(db: firestore.Client, doc_refs: List[firestore.DocumentReference]) -> int:
    if not doc_refs:
        return 0

    deleted = 0
    for chunk in _chunked(doc_refs, BATCH_WRITE_LIMIT):
        batch = db.batch()
        for ref in chunk:
            batch.delete(ref)
        batch.commit()
        deleted += len(chunk)
    return deleted


def delete_batch_data(db: firestore.Client, config: Dict[str, str], batch_id: str) -> None:
    logging.info("Deleting documents tagged with batch id %s", batch_id)

    parent_snaps = list(
        db.collection(config["parent_collection"])
        .where(filter=FieldFilter("testBatchId", "==", batch_id))
        .stream()
    )

    deleted_events = 0
    for parent_snap in parent_snaps:
        events_query = parent_snap.reference.collection(config["sub_collection"]).where(
            filter=FieldFilter("testBatchId", "==", batch_id)
        )
        event_refs = [snap.reference for snap in events_query.stream()]
        deleted_events += _delete_documents(db, event_refs)

    parent_refs = [snap.reference for snap in parent_snaps]
    deleted_users = _delete_documents(db, parent_refs)

    logging.info("Deleted %s event docs and %s parent docs for batch id %s", deleted_events, deleted_users, batch_id)


def main() -> None:
    logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")
    config = _load_config()

    parser = argparse.ArgumentParser(
        description="Add or delete bulk test documents in Firestore for listener testing."
    )
    parser.add_argument("--count", type=int, default=500, help="Number of test users (and events) to create.")
    parser.add_argument(
        "--batch-id",
        help="Identifier written to documents so the batch can be deleted later. Defaults to a UUID.",
    )
    parser.add_argument(
        "--delete",
        action="store_true",
        help="Delete all documents that were created with the provided --batch-id instead of creating new ones.",
    )
    args = parser.parse_args()

    if args.count < 1 and not args.delete:
        parser.error("--count must be at least 1 when creating data.")

    batch_id = args.batch_id or str(uuid.uuid4())
    db = _init_firestore(config)

    if args.delete:
        if not args.batch_id:
            parser.error("--delete requires --batch-id to target the correct records.")
        delete_batch_data(db, config, batch_id)
    else:
        add_batch_test_data(db, config, args.count, batch_id)
        logging.info("Re-run with --delete --batch-id %s to remove these records.", batch_id)


if __name__ == "__main__":
    main()


# python bulk_add_test_data.py --count 500 --batch-id my-test-batch


# python bulk_add_test_data.py --delete --batch-id my-test-batch

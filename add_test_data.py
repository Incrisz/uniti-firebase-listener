import argparse
import logging
import os
import uuid
from datetime import datetime, timezone
from typing import Dict, Any

from dotenv import load_dotenv
import firebase_admin
from firebase_admin import credentials, firestore


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


def build_sample_data(user_id: str, event_id: str) -> Dict[str, Any]:
    now = datetime.now(timezone.utc)
    return {
        "eventType": "TEST_EVENT",
        "message": "listener test",
        "userId": user_id,
        "sessionId": str(uuid.uuid4()),
        "deviceModel": "test-device",
        "androidVersion": "test",
        "createdAt": now.isoformat(),
        "updatedAt": now.isoformat(),
        "rank": 0,
        "totalTimeInForeground": 0,
        "totalTimeInForegroundMs": 0,
        "totalTimeInForegroundMinutes": 0,
        "eventId": event_id,
    }


def main() -> None:
    logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")
    config = _load_config()

    parser = argparse.ArgumentParser(description="Add a test document to Firestore.")
    parser.add_argument("--user-id", help="Parent document id under the parent collection", default=str(uuid.uuid4()))
    parser.add_argument("--event-id", help="Event document id for the subcollection", default=str(uuid.uuid4()))
    args = parser.parse_args()

    user_id = args.user_id
    event_id = args.event_id

    logging.info(
        "Writing test doc to %s/%s/%s/%s",
        config["parent_collection"],
        user_id,
        config["sub_collection"],
        event_id,
    )

    cred = credentials.Certificate(config["service_account_file"])
    firebase_admin.initialize_app(cred)
    db = firestore.client()

    doc_ref = (
        db.collection(config["parent_collection"])
        .document(user_id)
        .collection(config["sub_collection"])
        .document(event_id)
    )

    payload = build_sample_data(user_id, event_id)
    doc_ref.set(payload)

    logging.info("Created document at path: %s", doc_ref.path)
    logging.info("Payload: %s", payload)


if __name__ == "__main__":
    main()

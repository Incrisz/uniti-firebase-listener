#!/usr/bin/env python3
"""
Bulk-create synthetic users plus Firestore events for end-to-end testing.

What it does
- Inserts users, verifications, and user_goals rows in Postgres.
- Writes usage events in Firestore tagged with testBatchId for cleanup.
- Generates engaged vs dropoff histories so most users satisfy signals/milestones.
- Supports deletion of a prior batch: --delete --batch-id <id>

Env vars (reuse existing listener ones)
- SERVICE_ACCOUNT_FILE
- DATABASE_URL
- FIRESTORE_PARENT_COLLECTION (default: app_usage_events)
- FIRESTORE_COLLECTION (default: events)

Examples
  python bulk_seed_test_users.py --count 500 --batch-id my-batch
  python bulk_seed_test_users.py --delete --batch-id my-batch
"""

import argparse
import json
import os
import random
import uuid
from datetime import datetime, timedelta, timezone
from typing import Any, Dict, Iterable, List

import firebase_admin
from dotenv import load_dotenv
from firebase_admin import credentials, firestore
from google.cloud.firestore_v1 import FieldFilter

BATCH_WRITE_LIMIT = 450  # stay below Firestore 500 op limit

# Hardcoded app pools to avoid touching Postgres; adjust to your real packageNames if needed.
TIER1_APPS = [
    "inc.loop.ppt",
    "inc.loop.wallet",
    "com.mtn.momo",
    "com.oze",
    "com.booksmart",
]
TIER2_APPS = [
    "com.health.app",
    "com.invest.app",
    "com.learning.app",
]


def load_config() -> Dict[str, str]:
    load_dotenv()
    cfg = {
        "service_account_file": (os.getenv("SERVICE_ACCOUNT_FILE") or "").strip(),
        "parent_collection": (os.getenv("FIRESTORE_PARENT_COLLECTION") or "app_usage_events").strip(),
        "sub_collection": (os.getenv("FIRESTORE_COLLECTION") or "events").strip(),
    }
    missing = [k for k, v in cfg.items() if not v]
    if missing:
        raise RuntimeError(f"Missing required environment variables: {', '.join(missing)}")
    return cfg


def init_firestore(service_account_file: str) -> firestore.Client:
    with open(service_account_file, "r", encoding="utf-8") as f:
        sa = json.load(f)
    if not firebase_admin._apps:
        cred = credentials.Certificate(sa)
        firebase_admin.initialize_app(cred)
    return firestore.client()


def pick_apps() -> Dict[str, List[str]]:
    # Sample a few apps from hardcoded pools to simulate tier1/tier2 mix.
    t1 = random.sample(TIER1_APPS, k=min(2, len(TIER1_APPS)))
    t2 = random.sample(TIER2_APPS, k=min(1, len(TIER2_APPS)))
    return {"tier1": t1, "tier2": t2}


def build_user_record(idx: int, batch_id: str) -> Dict[str, Any]:
    user_id = str(uuid.uuid4())
    phone = f"+1555{str(int(datetime.now().timestamp()))[-5:]}{str(idx).zfill(3)}"
    return {
        "id": user_id,
        "name": f"Test User {idx + 1}",
        "email": f"test-user-{idx + 1}@example.com",
        "username": f"test_user_{idx + 1}",
        "phoneNumber": phone,
        "phone_number": phone,
    }


def iso_days_ago(days: int) -> str:
    return (datetime.now(timezone.utc) - timedelta(days=days)).isoformat()


def build_events(user_id: str, apps: List[str], batch_id: str, pattern: str = "engaged") -> List[Dict[str, Any]]:
    events: List[Dict[str, Any]] = []
    now_iso = datetime.now(timezone.utc).isoformat()
    app_list = apps or ["inc.loop.ppt"]
    is_dropoff = pattern == "dropoff"

    for app_id in app_list:
        weeks = list(range(1, 10)) if is_dropoff else list(range(0, 10))
        for week in weeks:
            minutes = random.randint(5, 20)
            ms = minutes * 60 * 1000
            days_ago = week * 7 + random.randint(0, 2)
            events.append(
                {
                    "eventType": "AGGREGATE",
                    "userId": user_id,
                    "sessionId": str(uuid.uuid4()),
                    "deviceModel": "test-device",
                    "androidVersion": "test",
                    "createdAt": now_iso,
                    "updatedAt": now_iso,
                    "date": iso_days_ago(days_ago),
                    "rank": 0,
                    "totalTimeInForeground": ms,
                    "totalTimeInForegroundMs": ms,
                    "totalTimeInForegroundMinutes": ms / (60 * 1000),
                    "eventId": str(uuid.uuid4()),
                    "packageName": app_id,
                    "testBatchId": batch_id,
                }
            )
    return events


def write_firestore_events(db: firestore.Client, config: Dict[str, str], user_id: str, events: List[Dict[str, Any]]) -> None:
    parent_ref = db.collection(config["parent_collection"]).document(user_id)
    parent_payload = {
        "userId": user_id,
        "testBatchId": events[0]["testBatchId"] if events else None,
        "createdAt": datetime.now(timezone.utc).isoformat(),
    }

    batch = db.batch()
    ops = 0

    batch.set(parent_ref, parent_payload, merge=True)
    ops += 1

    for evt in events:
        event_ref = parent_ref.collection(config["sub_collection"]).document(evt["eventId"])
        batch.set(event_ref, evt)
        ops += 1
        if ops >= BATCH_WRITE_LIMIT:
            batch.commit()
            batch = db.batch()
            ops = 0

    if ops:
        batch.commit()


def create_batch(db, config: Dict[str, str], count: int, batch_id: str, engaged_ratio: float) -> None:
    print(f"Creating {count} users with batch id {batch_id} (engaged ratio {engaged_ratio})")

    engaged_count = int(count * engaged_ratio)

    for i in range(count):
        profile = build_user_record(i, batch_id)
        plan = pick_apps()
        pattern = "engaged" if i < engaged_count else "dropoff"
        app_ids = plan["tier1"] or plan["tier2"]

        events = build_events(profile["id"], app_ids, batch_id, pattern)
        write_firestore_events(db, config, profile["id"], events)

    print(f"Finished creating batch {batch_id}. Re-run with --delete --batch-id {batch_id} to clean up.")


def delete_batch(db, config: Dict[str, str], batch_id: str) -> None:
    print(f"Deleting data for batch {batch_id} (Firestore only)")

    parents = (
        db.collection(config["parent_collection"])
        .where(filter=FieldFilter("testBatchId", "==", batch_id))
        .stream()
    )
    batch = db.batch()
    ops = 0
    for parent in parents:
        events_snap = (
            parent.reference.collection(config["sub_collection"])
            .where(filter=FieldFilter("testBatchId", "==", batch_id))
            .stream()
        )
        for evt in events_snap:
            batch.delete(evt.reference)
            ops += 1
            if ops >= BATCH_WRITE_LIMIT:
                batch.commit()
                batch = db.batch()
                ops = 0
        batch.delete(parent.reference)
        ops += 1
        if ops >= BATCH_WRITE_LIMIT:
            batch.commit()
            batch = db.batch()
            ops = 0
    if ops:
        batch.commit()
    print(f"Deleted batch {batch_id}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Seed synthetic users + events for pipeline testing.")
    parser.add_argument("--count", type=int, default=500, help="Number of users to create.")
    parser.add_argument("--batch-id", help="Identifier tagged on all records. Defaults to a UUID.")
    parser.add_argument("--engaged-ratio", type=float, default=0.75, help="0-1 fraction of users to make engaged/retained.")
    parser.add_argument("--delete", action="store_true", help="Delete records for the provided --batch-id instead of creating.")
    args = parser.parse_args()
    if args.engaged_ratio < 0 or args.engaged_ratio > 1:
        parser.error("--engaged-ratio must be between 0 and 1")
    if args.delete and not args.batch_id:
        parser.error("--delete requires --batch-id")
    return args


def main() -> None:
    args = parse_args()
    batch_id = args.batch_id or str(uuid.uuid4())
    config = load_config()
    db = init_firestore(config["service_account_file"])
    if args.delete:
        delete_batch(db, config, batch_id)
    else:
        if args.count < 1:
            raise RuntimeError("--count must be at least 1")
        create_batch(db, config, args.count, batch_id, args.engaged_ratio)


if __name__ == "__main__":
    main()




# python bulk_seed_test_users.py --count 500 --batch-id my-batch
# python bulk_seed_test_users.py --delete --batch-id my-batch
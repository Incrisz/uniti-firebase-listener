#!/usr/bin/env python3
"""
Seed Firestore events using existing users and apps from a Railway SQL dump.

What it does
- Reads user ids and app package names (appId) from railway_dump.sql.
- Creates Firestore parent docs + events tagged with testBatchId for cleanup.
- Supports cleanup of a prior batch: --delete --batch-id <id>

Env vars (reuse listener configs)
- SERVICE_ACCOUNT_FILE (path or JSON file for Firebase admin)
- FIRESTORE_PARENT_COLLECTION (default: app_usage_events)
- FIRESTORE_COLLECTION (default: events)

Examples
  python bulk_seed_from_dump.py --dump-file railway_dump.sql --count 200 --batch-id my-batch
  python bulk_seed_from_dump.py --dump-file railway_dump.sql --delete --batch-id my-batch
"""

import argparse
import json
import os
import random
import uuid
import time
from datetime import datetime, timedelta, timezone
from pathlib import Path
from typing import Any, Dict, Iterable, List, Sequence

import firebase_admin
from dotenv import load_dotenv
from firebase_admin import credentials, firestore
from google.cloud.firestore_v1 import FieldFilter

BATCH_WRITE_LIMIT = 450  # default upper bound; overridden by --batch-size


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


def _extract_copy_rows(dump_text: str, table: str) -> List[List[str]]:
    """
    Extract tab-separated rows from a COPY block for the given table name.
    Returns a list of list-of-columns (as strings).
    """
    marker = f"COPY public.{table} "
    parts = dump_text.split(marker)
    if len(parts) < 2:
        return []
    after_marker = parts[1]
    # Skip header line up to first newline
    rows_text = after_marker.split("\n", 1)[1]
    rows_section = rows_text.split("\n\\.\n", 1)[0]
    rows: List[List[str]] = []
    for line in rows_section.splitlines():
        if not line.strip():
            continue
        rows.append(line.split("\t"))
    return rows


def load_app_packages(dump_path: Path) -> List[str]:
    text = dump_path.read_text(encoding="utf-8")
    rows = _extract_copy_rows(text, "apps")
    # apps columns: id, createdAt, updatedAt, title, description, imageUrl, appId, countryCode, goalCategoryId
    # packageName should be the appId (e.g., org.worldreader.readtokids)
    packages = [row[6].strip() for row in rows if len(row) >= 7 and row[6].strip()]
    return packages


def load_user_ids(dump_path: Path) -> List[str]:
    text = dump_path.read_text(encoding="utf-8")
    rows = _extract_copy_rows(text, "users")
    # users columns: createdAt, updatedAt, phoneNumber, email, name, password, isVerified, profilePicture, countryCode,
    # idNumber, gender, birthdate, address, expiryDate, imageFront, imageBack, selfieImage, mailId, pin, primaryLanguageId,
    # secondaryLanguageId, id
    user_ids = [row[-1] for row in rows if row and row[-1].strip()]
    return user_ids


def iso_days_ago(days: int) -> str:
    return (datetime.now(timezone.utc) - timedelta(days=days)).isoformat()


def build_events(user_id: str, apps: Sequence[str], batch_id: str, pattern: str = "engaged") -> List[Dict[str, Any]]:
    events: List[Dict[str, Any]] = []
    now_iso = datetime.now(timezone.utc).isoformat()
    app_list = list(apps) or ["inc.loop.ppt"]
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


def _commit_and_maybe_sleep(batch: firestore.WriteBatch, ops: int, sleep_sec: float) -> None:
    if ops > 0:
        batch.commit()
        if sleep_sec > 0:
            time.sleep(sleep_sec)


def write_firestore_events(
    db: firestore.Client,
    config: Dict[str, str],
    user_id: str,
    events: List[Dict[str, Any]],
    batch_size: int,
    sleep_sec: float,
) -> None:
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
        if ops >= batch_size:
            _commit_and_maybe_sleep(batch, ops, sleep_sec)
            batch = db.batch()
            ops = 0

    _commit_and_maybe_sleep(batch, ops, sleep_sec)


def _chunked(seq: Sequence[Any], n: int) -> Iterable[Sequence[Any]]:
    for i in range(0, len(seq), n):
        yield seq[i : i + n]


def create_batch_from_dump(
    db: firestore.Client,
    config: Dict[str, str],
    dump_path: Path,
    count: int,
    batch_id: str,
    engaged_ratio: float,
    batch_size: int,
    sleep_sec: float,
) -> None:
    packages = load_app_packages(dump_path)
    user_ids = load_user_ids(dump_path)

    if not packages:
        raise RuntimeError(f"No app package names found in {dump_path}")
    if not user_ids:
        print(f"No user ids found in {dump_path}; will generate synthetic ids only.")

    random.shuffle(user_ids)

    desired = count if count and count > 0 else len(user_ids)

    # Always include all dump user ids; if we need more, generate synthetic ones.
    all_users: List[str] = list(user_ids)
    if desired > len(all_users):
        to_add = desired - len(all_users)
        all_users.extend(str(uuid.uuid4()) for _ in range(to_add))

    engaged_count = int(len(all_users) * engaged_ratio)

    print(
        f"Creating {len(all_users)} Firestore users/events using dump users ({len(user_ids)}) plus generated "
        f"({len(all_users) - len(user_ids)}) apps={len(packages)} dump={dump_path.name} "
        f"batch_id={batch_id} engaged_ratio={engaged_ratio}"
    )

    for idx, user_id in enumerate(all_users):
        pattern = "engaged" if idx < engaged_count else "dropoff"
        # pick 2 apps per user to keep volume reasonable
        app_sample = random.sample(packages, k=min(2, len(packages)))
        events = build_events(user_id, app_sample, batch_id, pattern)
        write_firestore_events(db, config, user_id, events, batch_size, sleep_sec)

    print(f"Finished creating batch {batch_id}. Re-run with --delete --batch-id {batch_id} to clean up.")


def delete_batch(
    db: firestore.Client,
    config: Dict[str, str],
    batch_id: str,
    batch_size: int,
    sleep_sec: float,
) -> None:
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
            if ops >= batch_size:
                _commit_and_maybe_sleep(batch, ops, sleep_sec)
                batch = db.batch()
                ops = 0
        batch.delete(parent.reference)
        ops += 1
        if ops >= batch_size:
            _commit_and_maybe_sleep(batch, ops, sleep_sec)
            batch = db.batch()
            ops = 0
    _commit_and_maybe_sleep(batch, ops, sleep_sec)
    print(f"Deleted batch {batch_id}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Seed Firestore using users/apps from a Railway SQL dump.")
    parser.add_argument("--dump-file", default="railway_dump.sql", help="Path to railway SQL dump containing users/apps.")
    parser.add_argument("--count", type=int, default=200, help="Number of users to create (from dump).")
    parser.add_argument("--batch-id", help="Identifier tagged on all records. Defaults to a UUID.")
    parser.add_argument("--engaged-ratio", type=float, default=0.75, help="0-1 fraction of users to make engaged/retained.")
    parser.add_argument("--delete", action="store_true", help="Delete records for the provided --batch-id instead of creating.")
    parser.add_argument("--batch-size", type=int, default=200, help="Firestore writes per commit (lower to reduce bursts).")
    parser.add_argument("--sleep-per-batch", type=float, default=0.25, help="Seconds to sleep after each commit (throttle).")
    args = parser.parse_args()
    if args.engaged_ratio < 0 or args.engaged_ratio > 1:
        parser.error("--engaged-ratio must be between 0 and 1")
    if args.delete and not args.batch_id:
        parser.error("--delete requires --batch-id")
    if args.count < 1 and not args.delete:
        parser.error("--count must be at least 1")
    if args.batch_size < 1:
        parser.error("--batch-size must be at least 1")
    if args.sleep_per_batch < 0:
        parser.error("--sleep-per-batch cannot be negative")
    return args


def main() -> None:
    args = parse_args()
    batch_id = args.batch_id or str(uuid.uuid4())
    config = load_config()
    db = init_firestore(config["service_account_file"])
    dump_path = Path(args.dump_file)
    if not dump_path.exists():
        raise FileNotFoundError(f"Dump file not found: {dump_path}")

    if args.delete:
        delete_batch(db, config, batch_id, args.batch_size, args.sleep_per_batch)
    else:
        create_batch_from_dump(
            db,
            config,
            dump_path,
            args.count,
            batch_id,
            args.engaged_ratio,
            args.batch_size,
            args.sleep_per_batch,
        )


if __name__ == "__main__":
    main()




# create events for 200 users from railway_dump.sql
# python bulk_seed_db.py --dump-file railway_dump.sql --count 200 --batch-id my-batch

# delete that batch
# python bulk_seed_db.py --dump-file railway_dump.sql --delete --batch-id my-batch

# python bulk_seed_db.py --dump-file railway_dump.sql \
#   --count 500 --batch-id my-batch \
#   --batch-size 100 --sleep-per-batch 0.5

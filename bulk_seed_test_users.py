#!/usr/bin/env python3
"""
Bulk-create synthetic users plus Firestore events for end-to-end testing.

What it does
- Writes usage events in Firestore tagged with testBatchId for cleanup.
- Generates engaged vs dropoff histories so most users satisfy signals/milestones.
- Optional: with --seed-db also inserts users/verifications/user_goals into Postgres to satisfy milestone logic.
- Supports deletion of a prior batch: --delete --batch-id <id>

Env vars (reuse existing listener ones)
- SERVICE_ACCOUNT_FILE
- FIRESTORE_PARENT_COLLECTION (default: app_usage_events)
- FIRESTORE_COLLECTION (default: events)
- DATABASE_URL (only when --seed-db is used)

Examples
  python bulk_seed_test_users.py --count 500 --batch-id my-batch
  python bulk_seed_test_users.py --delete --batch-id my-batch
"""

import argparse
import json
import os
import random
import uuid
import time
from datetime import datetime, timedelta, timezone
from typing import Any, Dict, Iterable, List, Tuple

import firebase_admin
from dotenv import load_dotenv
from firebase_admin import credentials, firestore
from google.cloud.firestore_v1 import FieldFilter
import psycopg2
from psycopg2.extras import execute_values

BATCH_WRITE_LIMIT = 450  # default upper bound; overridden by --batch-size

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


def get_columns(conn, table: str) -> List[str]:
    with conn.cursor() as cur:
        cur.execute(
            """
            select column_name
            from information_schema.columns
            where table_schema = 'public' and table_name = %s
            """,
            (table,),
        )
        return [r[0] for r in cur.fetchall()]


def ensure_tracking_table(conn) -> None:
    with conn.cursor() as cur:
        cur.execute(
            """
            create table if not exists test_user_batches (
              batch_id text not null,
              user_id uuid not null,
              phone_number text,
              created_at timestamptz default now()
            )
            """
        )
    conn.commit()


def load_catalog(conn) -> Dict[str, Any]:
    with conn.cursor() as cur:
        cur.execute('select id, "goalCategoryId", "goalSubCategoryId" from goals')
        goals = cur.fetchall()
        cur.execute(
            '''
            select a.id, a."appId", a."goalCategoryId", m."goalSubCategoriesId"
            from apps a
            left join app_goal_sub_categories m on m."appsId" = a.id
            '''
        )
        apps = cur.fetchall()

    subcat_to_apps: Dict[Any, List[str]] = {}
    category_to_apps: Dict[Any, List[str]] = {}

    for row in apps:
        _, app_id, cat_id, subcat_id = row
        if subcat_id:
            subcat_to_apps.setdefault(subcat_id, []).append(app_id)
        if cat_id:
            category_to_apps.setdefault(cat_id, []).append(app_id)

    return {"goals": goals, "subcat_to_apps": subcat_to_apps, "category_to_apps": category_to_apps}


def load_config() -> Dict[str, str]:
    load_dotenv()
    cfg = {
        "service_account_file": (os.getenv("SERVICE_ACCOUNT_FILE") or "").strip(),
        "parent_collection": (os.getenv("FIRESTORE_PARENT_COLLECTION") or "app_usage_events").strip(),
        "sub_collection": (os.getenv("FIRESTORE_COLLECTION") or "events").strip(),
        "database_url": (os.getenv("DATABASE_URL") or "").strip(),
    }
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


def pick_goals_and_apps(catalog: Dict[str, Any]) -> Dict[str, List[str]]:
    goals = catalog["goals"]
    subcat_to_apps = catalog["subcat_to_apps"]
    category_to_apps = catalog["category_to_apps"]

    selectable = [g for g in goals if g[2] and g[2] in subcat_to_apps]
    chosen = []
    pool = selectable.copy()
    while len(chosen) < 3 and pool:
        chosen.append(pool.pop(random.randrange(len(pool))))

    tier1_apps: set[str] = set()
    tier2_apps: set[str] = set()

    for g in chosen:
        _, cat_id, subcat_id = g
        tier1_apps.update(subcat_to_apps.get(subcat_id, []))
        tier2_apps.update(a for a in category_to_apps.get(cat_id, []) if a not in tier1_apps)

    all_apps = set(tier1_apps) | set(tier2_apps) | set(next(iter(category_to_apps.values()), []))
    if not tier1_apps and all_apps:
        tier1_apps.add(next(iter(all_apps)))

    return {"goals": chosen, "tier1": list(tier1_apps), "tier2": list(tier2_apps)}


def build_user_record(idx: int, batch_id: str) -> Dict[str, Any]:
    user_id = str(uuid.uuid4())
    phone = f"+1555{str(int(datetime.now().timestamp()))[-5:]}{str(idx).zfill(3)}"
    now = datetime.now(timezone.utc)
    photo = f"https://example.com/test/{batch_id}/user-{idx}.jpg"
    return {
        "id": user_id,
        "name": f"Test User {idx + 1}",
        "email": f"test-user-{idx + 1}@example.com",
        "username": f"test_user_{idx + 1}",
        "phoneNumber": phone,
        "phone_number": phone,
        "createdAt": now,
        "updatedAt": now,
        "isVerified": True,
        "imageFront": photo,
        "imageBack": photo,
        "selfieImage": photo,
    }


def build_fixed_user() -> Dict[str, Any]:
    # Always include this specific user before generating random ones.
    return {
        "id": "03dc138a-04da-4a0c-bd19-e9efbf238407",
        "name": "Pinned User",
        "email": "pinned-user@example.com",
        "username": "pinned_user",
        "phoneNumber": "+15550000000",
        "phone_number": "+15550000000",
        "createdAt": datetime.now(timezone.utc),
        "updatedAt": datetime.now(timezone.utc),
        "isVerified": True,
        "imageFront": "https://example.com/test/pinned/front.jpg",
        "imageBack": "https://example.com/test/pinned/back.jpg",
        "selfieImage": "https://example.com/test/pinned/selfie.jpg",
    }


def iso_days_ago(days: int) -> str:
    # Return date-only string (YYYY-MM-DD) without time component.
    return (datetime.now(timezone.utc) - timedelta(days=days)).date().isoformat()


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
                    "eventType": "Custom_Event",
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


def build_verification_row(user: Dict[str, Any], batch_id: str) -> Dict[str, Any]:
    now = datetime.now(timezone.utc)
    return {
        "phoneNumber": user["phoneNumber"],
        "phone_number": user["phoneNumber"],
        "verified": True,
        "code": "999999",
        "expiresAt": now + timedelta(minutes=5),
        "createdAt": now,
        "updatedAt": now,
    }


def build_user_goal_rows(user_id: str, goals: Iterable[Any], batch_id: str) -> List[Dict[str, Any]]:
    rows = []
    for g in goals:
        goal_id = g[0]
        rows.append(
            {
                "userId": user_id,
                "goalId": goal_id,
            }
        )
    return rows


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


def insert_user_bundle(conn, columns: Dict[str, List[str]], user: Dict[str, Any], goals: List[Any], batch_id: str) -> None:
    with conn:
        with conn.cursor() as cur:
            user_cols = [c for c in columns["users"] if c in user]
            if user_cols:
                user_values = [user[c] for c in user_cols]
                col_list = ", ".join([f'"{c}"' for c in user_cols])
                execute_values(cur, f'insert into "users" ({col_list}) values %s', [user_values])

            ver_row = build_verification_row(user, batch_id)
            ver_cols = [c for c in columns["verifications"] if c in ver_row]
            if ver_cols:
                ver_values = [ver_row[c] for c in ver_cols]
                col_list = ", ".join([f'"{c}"' for c in ver_cols])
                execute_values(cur, f'insert into "verifications" ({col_list}) values %s', [ver_values])

            user_goals_rows = build_user_goal_rows(user["id"], goals, batch_id)
            if user_goals_rows:
                cols = [c for c in columns["user_goals"] if c in user_goals_rows[0]]
                values = [[row[c] for c in cols] for row in user_goals_rows]
                col_list = ", ".join([f'"{c}"' for c in cols])
                execute_values(cur, f'insert into "user_goals" ({col_list}) values %s', values)

            cur.execute(
                'insert into test_user_batches (batch_id, user_id, phone_number) values (%s, %s, %s)',
                (batch_id, user["id"], user["phoneNumber"]),
            )


def create_batch(
    db,
    config: Dict[str, str],
    count: int,
    batch_id: str,
    engaged_ratio: float,
    seed_db: bool,
    batch_size: int,
    sleep_sec: float,
) -> None:
    print(f"Creating {count} users with batch id {batch_id} (engaged ratio {engaged_ratio}, seed_db={seed_db})")

    conn = None
    columns: Dict[str, List[str]] = {}
    catalog: Dict[str, Any] = {}

    if seed_db:
        conn = psycopg2.connect(config["database_url"])
        ensure_tracking_table(conn)
        columns = {
            "users": get_columns(conn, "users"),
            "verifications": get_columns(conn, "verifications"),
            "user_goals": get_columns(conn, "user_goals"),
        }
        catalog = load_catalog(conn)
        if not catalog["goals"]:
            raise RuntimeError("No goals found in DB; cannot seed user_goals when --seed-db is enabled.")

    engaged_count = int(count * engaged_ratio)

    # Always create the fixed user first.
    total_to_create = max(count, 1)
    fixed_profile = build_fixed_user()
    fixed_pattern = "engaged" if engaged_count > 0 else "dropoff"

    def process_user(profile: Dict[str, Any], idx: int, pattern: str) -> None:
        nonlocal conn, columns, catalog
        if seed_db:
            plan = pick_goals_and_apps(catalog)
            app_ids = plan["tier1"] or plan["tier2"]
            insert_user_bundle(conn, columns, profile, plan["goals"], batch_id)
        else:
            plan = pick_apps()
            app_ids = plan["tier1"] or plan["tier2"]
        events = build_events(profile["id"], app_ids, batch_id, pattern)
        write_firestore_events(db, config, profile["id"], events, batch_size, sleep_sec)

    # Fixed user
    process_user(fixed_profile, 0, fixed_pattern)

    # Remaining users
    remaining = total_to_create - 1
    for i in range(remaining):
        profile = build_user_record(i, batch_id)
        pattern = "engaged" if (i + 1) < engaged_count else "dropoff"
        process_user(profile, i + 1, pattern)

    if conn:
        conn.close()

    print(f"Finished creating batch {batch_id}. Re-run with --delete --batch-id {batch_id} to clean up.")


def delete_batch(
    db,
    config: Dict[str, str],
    batch_id: str,
    seed_db: bool,
    batch_size: int,
    sleep_sec: float,
) -> None:
    print(f"Deleting data for batch {batch_id} (Firestore{' + Postgres' if seed_db else ' only'})")

    if seed_db:
        conn = psycopg2.connect(config["database_url"])
        ensure_tracking_table(conn)
        with conn:
            with conn.cursor() as cur:
                cur.execute('select user_id, phone_number from test_user_batches where batch_id = %s', (batch_id,))
                rows = cur.fetchall()
                user_ids = [r[0] for r in rows]
                phones = [r[1] for r in rows if r[1]]
                if user_ids:
                    cur.execute('delete from milestone_logs where user_id = any(%s)', (user_ids,))
                    cur.execute('delete from signal_logs where user_id = any(%s)', (user_ids,))
                    cur.execute('delete from "user_goals" where "userId" = any(%s)', (user_ids,))
                    cur.execute('delete from users where id = any(%s)', (user_ids,))
                if phones:
                    cur.execute('delete from verifications where "phoneNumber" = any(%s)', (phones,))
                cur.execute('delete from test_user_batches where batch_id = %s', (batch_id,))
        conn.close()

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
    parser = argparse.ArgumentParser(description="Seed synthetic users + events for pipeline testing.")
    parser.add_argument("--count", type=int, default=500, help="Number of users to create.")
    parser.add_argument("--batch-id", help="Identifier tagged on all records. Defaults to a UUID.")
    parser.add_argument("--engaged-ratio", type=float, default=0.75, help="0-1 fraction of users to make engaged/retained.")
    parser.add_argument("--delete", action="store_true", help="Delete records for the provided --batch-id instead of creating.")
    parser.add_argument("--seed-db", action="store_true", help="Also seed Postgres (users, verifications, user_goals) to enable milestones.")
    parser.add_argument("--batch-size", type=int, default=200, help="Firestore writes per commit (lower to reduce bursts).")
    parser.add_argument("--sleep-per-batch", type=float, default=0.25, help="Seconds to sleep after each commit (throttle).")
    args = parser.parse_args()
    if args.engaged_ratio < 0 or args.engaged_ratio > 1:
        parser.error("--engaged-ratio must be between 0 and 1")
    if args.delete and not args.batch_id:
        parser.error("--delete requires --batch-id")
    if args.batch_size < 1:
        parser.error("--batch-size must be at least 1")
    if args.sleep_per_batch < 0:
        parser.error("--sleep-per-batch cannot be negative")
    return args


def main() -> None:
    args = parse_args()
    batch_id = args.batch_id or str(uuid.uuid4())
    config = load_config()
    if args.seed_db and not config["database_url"]:
        raise RuntimeError("--seed-db requires DATABASE_URL to be set")
    db = init_firestore(config["service_account_file"])
    if args.delete:
        delete_batch(db, config, batch_id, args.seed_db, args.batch_size, args.sleep_per_batch)
    else:
        if args.count < 1:
            raise RuntimeError("--count must be at least 1")
        create_batch(
            db,
            config,
            args.count,
            batch_id,
            args.engaged_ratio,
            args.seed_db,
            args.batch_size,
            args.sleep_per_batch,
        )


if __name__ == "__main__":
    main()




# python bulk_seed_test_users.py --count 500 --batch-id my-batch







# python bulk_seed_test_users.py --seed-db --count 100 --batch-id my-batch

# python bulk_seed_test_users.py --delete --batch-id my-batch

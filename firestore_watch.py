"""
Simple Firestore watcher that prints real-time document changes.
Use to verify the Firebase connection without sending data to Kinesis.
"""

import json
import os
import time

from dotenv import load_dotenv
import firebase_admin
from firebase_admin import credentials, firestore


load_dotenv()

collection_name = os.getenv("FIRESTORE_COLLECTION", "app_usage_logs")
service_account_file = os.getenv("SERVICE_ACCOUNT_FILE", "google-services.json")

if not firebase_admin._apps:
    cred = credentials.Certificate(service_account_file)
    firebase_admin.initialize_app(cred)

db = firestore.client()

print(f"Listening for changes in collection '{collection_name}'... (Ctrl+C to stop)")


def on_snapshot(col_snapshot, changes, read_time):
    for change in changes:
        doc = change.document
        data = doc.to_dict()
        change_type = change.type.name
        timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
        print(f"[{timestamp}] {change_type} -> {doc.id}: {json.dumps(data, default=str)}")


query = db.collection(collection_name)
query.on_snapshot(on_snapshot)

while True:
    time.sleep(60)

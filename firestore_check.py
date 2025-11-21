"""
One-off Firestore connectivity check.
Lists documents in the target collection to confirm credentials and access.
"""

import os
import json
from dotenv import load_dotenv
import firebase_admin
from firebase_admin import credentials, firestore

load_dotenv()

collection_name = os.getenv("FIRESTORE_COLLECTION", "app_usage_logs")
service_account_file = os.getenv("SERVICE_ACCOUNT_FILE", "serviceAccount.json")

# Delete existing app if it exists to ensure clean initialization
if firebase_admin._apps:
    firebase_admin.delete_app(firebase_admin.get_app())

cred = credentials.Certificate(service_account_file)
firebase_admin.initialize_app(cred)

db = firestore.client()

info = credentials.Certificate(service_account_file)
print(f"Checking Firestore connection... collection='{collection_name}'")
print(f"Using service account project_id='{info.project_id}', client_email='{info.service_account_email}'")

try:
    # list root collections to confirm we're pointed at the right project/db
    root_cols = [c.id for c in db.collections()]
    print(f"Root collections: {root_cols or 'none'}")

    # Use .limit() to avoid timeout issues on large collections
    docs = list(db.collection(collection_name).limit(5).stream())
    print(f"Retrieved {len(docs)} document(s) from '{collection_name}' (limited to 5).")
    for doc in docs:
        print(f"- {doc.id}: {json.dumps(doc.to_dict(), default=str)}")
    if not docs:
        print("Collection is empty (but connection succeeded).")
except Exception as exc:
    import traceback
    print(f"❌ Firestore check failed: {exc}")
    print("\nFull traceback:")
    traceback.print_exc()

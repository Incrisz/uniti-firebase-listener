"""
Quick test to add a document to Firestore with current timestamp
"""
import os
import time
from dotenv import load_dotenv
import firebase_admin
from firebase_admin import credentials, firestore

load_dotenv(override=True)

service_account_file = os.getenv("SERVICE_ACCOUNT_FILE", "serviceAccount.json")
collection_name = os.getenv("FIRESTORE_COLLECTION", "app_usage_logs")

# Delete existing app if it exists
if firebase_admin._apps:
    firebase_admin.delete_app(firebase_admin.get_app())

# Initialize Firebase
cred = credentials.Certificate(service_account_file)
firebase_admin.initialize_app(cred)
db = firestore.client()

# Create test document with current timestamp
current_timestamp = int(time.time() * 1000)
test_doc = {
    'timestamp': current_timestamp,
    'test': True,
    'message': 'Test document from listener test',
    'created_at': time.strftime('%Y-%m-%d %H:%M:%S')
}

print(f"Adding test document with timestamp: {current_timestamp}")
print(f"Document data: {test_doc}")

doc_ref = db.collection(collection_name).add(test_doc)
print(f"\n✅ Document added with ID: {doc_ref[1].id}")
print(f"\nThe listener should detect and send this to Kinesis within seconds!")

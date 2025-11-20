import firebase_admin
from firebase_admin import credentials, firestore
import boto3
import json
import time
from dotenv import load_dotenv
import os

load_dotenv()

# AWS Kinesis client
kinesis_client = boto3.client(
    'kinesis',
    region_name=os.getenv("AWS_DEFAULT_REGION")
)

KINESIS_STREAM = os.getenv("KINESIS_STREAM")
# Initialize Firestore Admin
service_account_file = os.getenv("SERVICE_ACCOUNT_FILE", "serviceAccount.json")
cred = credentials.Certificate(service_account_file)
firebase_admin.initialize_app(cred)

db = firestore.client()

print("🔥 Real-time Firestore → AWS Kinesis bridge started...")


def get_collection_state():
    """
    Reads the entire collection and returns a list of {id, data} documents.
    """
    docs = db.collection(collection_name).stream()
    return [{"id": doc.id, "data": doc.to_dict()} for doc in docs]


def send_to_kinesis(document_id, change_type, data):
    """
    Sends the Firestore event and full collection snapshot to AWS Kinesis.
    """
    collection_state = get_collection_state()

    payload = {
        "id": document_id,
        "type": change_type,
        "data": data,  # current doc contents
        "collection": collection_state,  # all docs in the collection
        "timestamp": int(time.time() * 1000)
    }

    print("➡ Sending to Kinesis:", payload)

    kinesis_client.put_record(
        StreamName=KINESIS_STREAM,
        Data=json.dumps(payload),
        PartitionKey=document_id
    )

    print("✔ Sent to Kinesis")


def on_snapshot(col_snapshot, changes, read_time):
    """
    Callback function for Firestore real-time updates.
    """
    for change in changes:
        doc = change.document
        doc_id = doc.id
        data = doc.to_dict()

        if change.type.name == 'ADDED':
            print(f"🟢 New document: {doc_id}")
            send_to_kinesis(doc_id, "ADDED", data)

        elif change.type.name == 'MODIFIED':
            print(f"🟡 Modified document: {doc_id}")
            send_to_kinesis(doc_id, "MODIFIED", data)

        elif change.type.name == 'REMOVED':
            print(f"🔴 Removed document: {doc_id}")
            send_to_kinesis(doc_id, "REMOVED", data)


# Listen to a Firestore collection in real time (override via FIRESTORE_COLLECTION in .env)
collection_name = os.getenv("FIRESTORE_COLLECTION", "app_usage_logs")


def start_watch():
    """
    Starts the Firestore watch and auto-retries with backoff if the stream drops.
    """
    backoff = 1
    while True:
        watch = None
        try:
            query = db.collection(collection_name)
            watch = query.on_snapshot(on_snapshot)
            print(f"👂 Listening for changes in '{collection_name}' (Ctrl+C to stop)")

            # Block until the watch thread exits; if it does, restart with backoff.
            if hasattr(watch, "_thread"):
                watch._thread.join()
                raise RuntimeError("Firestore watch thread stopped")
            else:
                while True:
                    time.sleep(60)

        except KeyboardInterrupt:
            print("Stopping listener...")
            break
        except Exception as exc:
            print(f"⚠️ Firestore watch error: {exc}. Retrying in {backoff}s...")
            time.sleep(backoff)
            backoff = min(backoff * 2, 60)
        finally:
            if watch:
                try:
                    watch.unsubscribe()
                except Exception:
                    pass


start_watch()

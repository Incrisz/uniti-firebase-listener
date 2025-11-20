import firebase_admin
from firebase_admin import credentials, firestore
import boto3
import json
import time
import queue
import threading
from dotenv import load_dotenv
import os

load_dotenv()

# AWS clients
aws_region = os.getenv("AWS_DEFAULT_REGION")
kinesis_client = boto3.client("kinesis", region_name=aws_region)
secrets_client = boto3.client("secretsmanager", region_name=aws_region)

KINESIS_STREAM = os.getenv("KINESIS_STREAM")
FIREBASE_SECRET_ID = os.getenv("FIREBASE_SECRET_ID", "firebase-service-account")


def load_service_account():
    """
    Fetch service account JSON from AWS Secrets Manager.
    """
    resp = secrets_client.get_secret_value(SecretId=FIREBASE_SECRET_ID)
    secret_str = resp.get("SecretString")
    if not secret_str:
        secret_str = resp["SecretBinary"]
        if isinstance(secret_str, (bytes, bytearray)):
            secret_str = secret_str.decode("utf-8")
    return json.loads(secret_str)


# Initialize Firestore Admin using secret-managed credentials
service_account_info = load_service_account()
cred = credentials.Certificate(service_account_info)
firebase_admin.initialize_app(cred)

db = firestore.client()

print("🔥 Real-time Firestore → AWS Kinesis bridge started (Secrets Manager creds)...")


def get_collection_state():
    """
    Reads the entire collection and returns a list of {id, data} documents.
    """
    docs = db.collection(collection_name).stream()
    return [{"id": doc.id, "data": doc.to_dict()} for doc in docs]


def send_to_kinesis(document_id, change_type, data):
    """
    Sends the full collection snapshot to AWS Kinesis (single payload).
    """
    collection_state = get_collection_state()

    payload = {
        "collection": collection_state,
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
    Callback function for Firestore real-time updates. Enqueues work off-thread.
    """
    for change in changes:
        doc = change.document
        doc_id = doc.id
        data = doc.to_dict()

        event = None
        if change.type.name == "ADDED":
            event = ("ADDED", "🟢")
        elif change.type.name == "MODIFIED":
            event = ("MODIFIED", "🟡")
        elif change.type.name == "REMOVED":
            event = ("REMOVED", "🔴")

        if event:
            change_type, icon = event
            print(f"{icon} Queued {change_type} for document: {doc_id}")
            work_queue.put((doc_id, change_type, data))


# Listen to a Firestore collection in real time (override via FIRESTORE_COLLECTION in .env)
collection_name = os.getenv("FIRESTORE_COLLECTION", "app_usage_logs")
work_queue = queue.Queue()


def worker_loop():
    """
    Processes queued Firestore changes outside the watch thread to avoid blocking it.
    """
    while True:
        doc_id, change_type, data = work_queue.get()
        try:
            send_to_kinesis(doc_id, change_type, data)
        except Exception as exc:
            print(f"⚠️ Kinesis send failed for {doc_id}: {exc}")
        finally:
            work_queue.task_done()


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
            backoff = 1  # reset after successful start

            # Wait until the watch signals close; then trigger retry.
            closed_event = getattr(watch, "_closed", None)
            if closed_event:
                while True:
                    if closed_event.wait(timeout=60):
                        raise RuntimeError("Firestore watch stopped (closed event)")
            elif hasattr(watch, "_thread"):
                watch._thread.join()
                raise RuntimeError("Firestore watch stopped (thread exited)")
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


worker = threading.Thread(target=worker_loop, daemon=True)
worker.start()

start_watch()

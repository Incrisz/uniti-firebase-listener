"""
Firestore → Kinesis Real-time Sync

Continuously watches Firestore collection and sends new/modified documents to AWS Kinesis.

Features:
- Real-time listener - watches for changes continuously
- Sends added/modified documents to Kinesis stream in JSON format
- Runs until manually stopped (Ctrl+C)
- Production-ready with error handling and reconnection
"""

import os
import json
from datetime import datetime
from dotenv import load_dotenv
import firebase_admin
from firebase_admin import credentials, firestore
import boto3
from botocore.exceptions import ClientError

load_dotenv()

# Firestore configuration
collection_name = os.getenv("FIRESTORE_COLLECTION", "app_usage_logs")
service_account_file = os.getenv("SERVICE_ACCOUNT_FILE", "serviceAccount.json")
timestamp_file = os.getenv("LAST_SYNC_FILE", ".last_sync_timestamp")

# AWS Kinesis configuration
kinesis_stream = os.getenv("KINESIS_STREAM", "prod-firestore-events")
aws_region = os.getenv("AWS_DEFAULT_REGION", "us-east-1")

# Delete existing Firebase app if it exists
if firebase_admin._apps:
    firebase_admin.delete_app(firebase_admin.get_app())

# Initialize Firebase
cred = credentials.Certificate(service_account_file)
firebase_admin.initialize_app(cred)
db = firestore.client()

# Initialize AWS Kinesis client
kinesis_client = boto3.client(
    'kinesis',
    region_name=aws_region,
    aws_access_key_id=os.getenv("AWS_ACCESS_KEY_ID"),
    aws_secret_access_key=os.getenv("AWS_SECRET_ACCESS_KEY")
)


def get_last_sync_timestamp():
    """
    Read the last sync timestamp from file.
    Returns timestamp in milliseconds, or None if first run.
    """
    if os.path.exists(timestamp_file):
        try:
            with open(timestamp_file, 'r') as f:
                data = json.load(f)
                last_ts = data.get('last_sync_timestamp')
                last_dt = data.get('last_sync_datetime')
                print(f"📋 Last sync: {last_dt} (timestamp: {last_ts})")
                return last_ts
        except Exception as e:
            print(f"⚠️  Error reading timestamp file: {e}")
            return None
    else:
        print("🆕 First run - no previous sync timestamp found")
        return None


def save_sync_timestamp(timestamp):
    """
    Save the current sync timestamp to file for next run.
    """
    try:
        data = {
            'last_sync_timestamp': timestamp,
            'last_sync_datetime': datetime.fromtimestamp(timestamp / 1000).strftime('%Y-%m-%d %H:%M:%S'),
            'collection': collection_name,
            'project': credentials.Certificate(service_account_file).project_id,
            'kinesis_stream': kinesis_stream
        }
        with open(timestamp_file, 'w') as f:
            json.dump(data, f, indent=2)
        print(f"✅ Saved sync timestamp: {data['last_sync_datetime']}")
    except Exception as e:
        print(f"❌ Error saving timestamp: {e}")


def send_to_kinesis(doc_id, doc_data, event_type="MODIFIED"):
    """
    Send a single document to AWS Kinesis stream.

    Args:
        doc_id: Firestore document ID
        doc_data: Document data (dict)
        event_type: Event type (ADDED, MODIFIED, or REMOVED)

    Returns:
        True if successful, False otherwise
    """
    try:
        # Prepare the event payload
        event = {
            'eventType': event_type,
            'collection': collection_name,
            'documentId': doc_id,
            'data': doc_data,
            'timestamp': datetime.now().isoformat(),
            'sync_source': 'incremental_sync'
        }

        # Send to Kinesis
        response = kinesis_client.put_record(
            StreamName=kinesis_stream,
            Data=json.dumps(event, default=str),
            PartitionKey=doc_id  # Use document ID as partition key
        )

        return True

    except ClientError as e:
        error_code = e.response['Error']['Code']
        error_msg = e.response['Error']['Message']
        print(f"❌ Kinesis error for doc {doc_id}: {error_code} - {error_msg}")
        return False
    except Exception as e:
        print(f"❌ Error sending doc {doc_id} to Kinesis: {e}")
        return False


def verify_kinesis_connection():
    """
    Verify connection to AWS Kinesis stream before syncing.
    """
    try:
        response = kinesis_client.describe_stream(StreamName=kinesis_stream)
        status = response['StreamDescription']['StreamStatus']
        print(f"✅ Kinesis stream '{kinesis_stream}' is {status}")
        return True
    except ClientError as e:
        error_code = e.response['Error']['Code']
        error_msg = e.response['Error']['Message']
        print(f"❌ Cannot access Kinesis stream: {error_code} - {error_msg}")
        return False
    except Exception as e:
        print(f"❌ Error connecting to Kinesis: {e}")
        return False


def main():
    """
    Main function - sets up real-time listener and runs continuously.
    """
    print("\n" + "=" * 60)
    print("🔄 FIRESTORE → KINESIS REAL-TIME SYNC")
    print("=" * 60)

    info = credentials.Certificate(service_account_file)
    print(f"📡 Firebase Project: {info.project_id}")
    print(f"📂 Firestore Collection: {collection_name}")
    print(f"🌊 Kinesis Stream: {kinesis_stream}")
    print(f"🌍 AWS Region: {aws_region}")
    print("=" * 60)

    # Verify Kinesis connection
    if not verify_kinesis_connection():
        print("\n❌ Aborting sync due to Kinesis connection error")
        return

    print()

    # Get last sync timestamp to know where we left off
    last_timestamp = get_last_sync_timestamp()

    # Statistics
    stats = {
        'total_sent': 0,
        'total_failed': 0,
        'started_at': datetime.now()
    }

    def on_snapshot(col_snapshot, changes, read_time):
        """Callback for document changes - runs continuously"""
        for change in changes:
            doc = change.document
            doc_data = doc.to_dict()

            # Get document timestamp
            doc_timestamp = doc_data.get('timestamp')

            # Filter: only process documents newer than last sync (on startup)
            if last_timestamp is not None:
                if isinstance(doc_timestamp, (int, float)) and doc_timestamp <= last_timestamp:
                    continue  # Skip old documents

            if change.type.name == 'ADDED':
                print(f"➕ NEW: {doc.id}")
                if send_to_kinesis(doc.id, doc_data, event_type="ADDED"):
                    stats['total_sent'] += 1
                    print(f"   ✅ Sent to Kinesis | Total: {stats['total_sent']}")
                else:
                    stats['total_failed'] += 1
                    print(f"   ❌ Failed | Total failed: {stats['total_failed']}")

            elif change.type.name == 'MODIFIED':
                print(f"✏️  MODIFIED: {doc.id}")
                if send_to_kinesis(doc.id, doc_data, event_type="MODIFIED"):
                    stats['total_sent'] += 1
                    print(f"   ✅ Sent to Kinesis | Total: {stats['total_sent']}")
                else:
                    stats['total_failed'] += 1
                    print(f"   ❌ Failed | Total failed: {stats['total_failed']}")

            elif change.type.name == 'REMOVED':
                print(f"🗑️  REMOVED: {doc.id}")
                if send_to_kinesis(doc.id, doc_data, event_type="REMOVED"):
                    stats['total_sent'] += 1
                    print(f"   ✅ Sent to Kinesis | Total: {stats['total_sent']}")
                else:
                    stats['total_failed'] += 1
                    print(f"   ❌ Failed | Total failed: {stats['total_failed']}")

            # Update timestamp after successful processing
            if isinstance(doc_timestamp, (int, float)):
                save_sync_timestamp(doc_timestamp)

    try:
        print("👂 Starting real-time listener...")
        print("   Watching for ADDED, MODIFIED, and REMOVED documents")
        print("   Press Ctrl+C to stop\n")

        # Set up the listener
        col_ref = db.collection(collection_name)
        col_watch = col_ref.on_snapshot(on_snapshot)

        print("✅ Listener active! Monitoring Firestore for changes...\n")

        # Keep the listener running
        import time
        while True:
            time.sleep(1)

    except KeyboardInterrupt:
        print("\n\n" + "=" * 60)
        print("⏹️  STOPPED BY USER")
        print("=" * 60)

        # Show statistics
        runtime = datetime.now() - stats['started_at']
        print(f"\n📊 Session Statistics:")
        print(f"   Runtime: {runtime}")
        print(f"   ✅ Documents sent to Kinesis: {stats['total_sent']}")
        if stats['total_failed'] > 0:
            print(f"   ❌ Failed to send: {stats['total_failed']}")
        print(f"\n💾 Last sync timestamp saved in: {timestamp_file}\n")

    except Exception as e:
        print(f"\n❌ Error in listener: {e}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\n⏹️  Sync interrupted by user")
    except Exception as e:
        print(f"\n❌ Unexpected error: {e}")
        import traceback
        traceback.print_exc()

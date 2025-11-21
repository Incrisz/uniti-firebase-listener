"""
Firestore Incremental Sync - Pull only added or modified data since last run.

This script:
1. Tracks the last sync timestamp in a local file
2. On each run, pulls only documents added/modified since last sync
3. Updates the timestamp for the next run
4. Exports new/modified data to JSON
"""

import os
import json
from datetime import datetime
from dotenv import load_dotenv
import firebase_admin
from firebase_admin import credentials, firestore

load_dotenv()

collection_name = os.getenv("FIRESTORE_COLLECTION", "app_usage_logs")
service_account_file = os.getenv("SERVICE_ACCOUNT_FILE", "serviceAccount.json")
timestamp_file = os.getenv("LAST_SYNC_FILE", ".last_sync_timestamp")
output_dir = os.getenv("SYNC_OUTPUT_DIR", "sync_output")

# Delete existing app if it exists to ensure clean initialization
if firebase_admin._apps:
    firebase_admin.delete_app(firebase_admin.get_app())

cred = credentials.Certificate(service_account_file)
firebase_admin.initialize_app(cred)

db = firestore.client()

# Create output directory if it doesn't exist
os.makedirs(output_dir, exist_ok=True)


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
            'project': credentials.Certificate(service_account_file).project_id
        }
        with open(timestamp_file, 'w') as f:
            json.dump(data, f, indent=2)
        print(f"✅ Saved sync timestamp: {data['last_sync_datetime']}")
    except Exception as e:
        print(f"❌ Error saving timestamp: {e}")


def pull_incremental_data(last_timestamp=None, timestamp_field="timestamp", batch_size=1000):
    """
    Pull only documents added or modified since last_timestamp.

    Args:
        last_timestamp: Unix timestamp in milliseconds (None = pull all)
        timestamp_field: Name of the timestamp field in documents
        batch_size: Number of documents to fetch per batch

    Returns:
        List of document snapshots
    """
    print(f"\n{'='*60}")
    print(f"🔄 Starting incremental sync...")
    print(f"Collection: {collection_name}")
    print(f"Timestamp field: {timestamp_field}")
    print(f"{'='*60}\n")

    all_docs = []

    try:
        if last_timestamp is None:
            # First run - pull all data (with limit for safety)
            print("⚠️  No previous timestamp - pulling ALL data (limited to 10,000)")

            last_doc = None
            total_fetched = 0
            max_docs = 10000  # Safety limit for first run

            while True:
                query = db.collection(collection_name).limit(batch_size)

                if last_doc:
                    query = query.start_after(last_doc)

                docs = list(query.stream())

                if not docs:
                    break

                batch_count = len(docs)
                total_fetched += batch_count
                all_docs.extend(docs)

                print(f"  📦 Fetched batch: {batch_count} docs | Total: {total_fetched}")

                if total_fetched >= max_docs:
                    print(f"  ⚠️  Reached safety limit: {max_docs} docs")
                    break

                last_doc = docs[-1]

                if batch_count < batch_size:
                    break

        else:
            # Incremental sync - only new/modified data
            cutoff_dt = datetime.fromtimestamp(last_timestamp / 1000).strftime('%Y-%m-%d %H:%M:%S')
            print(f"📅 Pulling documents modified after: {cutoff_dt}")
            print(f"   (timestamp > {last_timestamp})\n")

            # Query with pagination for large result sets
            last_doc = None
            total_fetched = 0

            while True:
                query = db.collection(collection_name) \
                    .where(timestamp_field, ">", last_timestamp) \
                    .limit(batch_size)

                if last_doc:
                    query = query.start_after(last_doc)

                docs = list(query.stream())

                if not docs:
                    break

                batch_count = len(docs)
                total_fetched += batch_count
                all_docs.extend(docs)

                print(f"  📦 Fetched batch: {batch_count} docs | Total: {total_fetched}")

                last_doc = docs[-1]

                if batch_count < batch_size:
                    break

        print(f"\n✅ Total new/modified documents: {len(all_docs)}")
        return all_docs

    except Exception as e:
        print(f"\n❌ Error during incremental sync: {e}")
        import traceback
        traceback.print_exc()
        return all_docs


def export_incremental_data(docs, prefix="incremental"):
    """
    Export incremental data to JSON file with timestamp in filename.

    Args:
        docs: List of document snapshots
        prefix: Prefix for output filename
    """
    if not docs:
        print("\n📭 No new documents to export")
        return None

    timestamp_str = datetime.now().strftime('%Y%m%d_%H%M%S')
    output_file = os.path.join(output_dir, f"{prefix}_sync_{timestamp_str}.json")

    try:
        data = {
            'sync_info': {
                'collection': collection_name,
                'sync_datetime': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                'document_count': len(docs),
                'project': credentials.Certificate(service_account_file).project_id
            },
            'documents': []
        }

        for doc in docs:
            data['documents'].append({
                'id': doc.id,
                'data': doc.to_dict()
            })

        with open(output_file, 'w') as f:
            json.dump(data, f, indent=2, default=str)

        print(f"\n💾 Exported {len(docs)} document(s) to: {output_file}")

        # Print file size
        file_size = os.path.getsize(output_file)
        if file_size < 1024:
            size_str = f"{file_size} bytes"
        elif file_size < 1024 * 1024:
            size_str = f"{file_size / 1024:.2f} KB"
        else:
            size_str = f"{file_size / (1024 * 1024):.2f} MB"
        print(f"   File size: {size_str}")

        return output_file

    except Exception as e:
        print(f"\n❌ Error exporting data: {e}")
        import traceback
        traceback.print_exc()
        return None


def show_sample_documents(docs, count=5):
    """
    Display sample documents from the pulled data.
    """
    if not docs:
        return

    print(f"\n📄 Sample documents (showing up to {count}):")
    print("-" * 60)

    for i, doc in enumerate(docs[:count], 1):
        data = doc.to_dict()
        timestamp = data.get('timestamp', 'N/A')

        # Format timestamp if available
        if isinstance(timestamp, (int, float)):
            ts_formatted = datetime.fromtimestamp(timestamp / 1000).strftime('%Y-%m-%d %H:%M:%S')
        else:
            ts_formatted = 'N/A'

        print(f"\n{i}. Document ID: {doc.id}")
        print(f"   Timestamp: {timestamp} ({ts_formatted})")

        # Show first few fields
        fields_shown = 0
        for key, value in data.items():
            if fields_shown >= 5:
                print(f"   ... ({len(data) - fields_shown} more fields)")
                break
            if key != 'timestamp':
                value_str = str(value)
                if len(value_str) > 50:
                    value_str = value_str[:47] + "..."
                print(f"   {key}: {value_str}")
                fields_shown += 1


def main():
    """
    Main function to run incremental sync.
    """
    print("\n" + "=" * 60)
    print("🔄 FIRESTORE INCREMENTAL SYNC")
    print("=" * 60)

    info = credentials.Certificate(service_account_file)
    print(f"📡 Connected to project: {info.project_id}")
    print(f"📂 Collection: {collection_name}")
    print(f"📁 Output directory: {output_dir}/")

    # Get last sync timestamp
    last_timestamp = get_last_sync_timestamp()

    # Pull incremental data
    docs = pull_incremental_data(last_timestamp)

    if docs:
        # Show sample documents
        show_sample_documents(docs)

        # Export to JSON
        output_file = export_incremental_data(docs)

        # Get the latest timestamp from pulled documents
        latest_timestamp = None
        for doc in docs:
            doc_data = doc.to_dict()
            doc_timestamp = doc_data.get('timestamp')
            if isinstance(doc_timestamp, (int, float)):
                if latest_timestamp is None or doc_timestamp > latest_timestamp:
                    latest_timestamp = doc_timestamp

        # Save timestamp for next run
        if latest_timestamp:
            save_sync_timestamp(latest_timestamp)
        else:
            # If no timestamp field found, use current time
            current_timestamp = int(datetime.now().timestamp() * 1000)
            save_sync_timestamp(current_timestamp)
            print("⚠️  No timestamp field found in documents, using current time")

    else:
        print("\n✨ No new documents since last sync - everything is up to date!")

        # Still update timestamp to current time
        current_timestamp = int(datetime.now().timestamp() * 1000)
        save_sync_timestamp(current_timestamp)

    print("\n" + "=" * 60)
    print("✅ SYNC COMPLETE")
    print("=" * 60)

    # Show next steps
    print("\n💡 Next steps:")
    print(f"   • Run this script again to pull only new/modified data")
    print(f"   • Check {output_dir}/ for exported JSON files")
    print(f"   • Last sync timestamp saved in: {timestamp_file}")
    print(f"   • To reset and start fresh, delete: {timestamp_file}\n")


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\n⏹️  Sync interrupted by user")
    except Exception as e:
        print(f"\n❌ Unexpected error: {e}")
        import traceback
        traceback.print_exc()

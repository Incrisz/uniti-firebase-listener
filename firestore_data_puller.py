"""
Firestore data puller with multiple strategies:
1. Pull all data with pagination (recommended for large collections)
2. Pull only new/modified data using timestamps
3. Real-time listener for added/modified documents
"""

import os
import json
from datetime import datetime, timedelta
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

print(f"Connected to Firestore")
info = credentials.Certificate(service_account_file)
print(f"Project: {info.project_id}, Collection: '{collection_name}'\n")


def pull_all_data_paginated(page_size=1000, max_docs=None):
    """
    Pull ALL data from Firestore using pagination.
    This is the most reliable way to get all documents from large collections.

    Args:
        page_size: Number of documents to fetch per batch (default: 1000)
        max_docs: Maximum number of documents to fetch (None = unlimited)
    """
    print(f"=== Strategy 1: Pull ALL data with pagination ===")
    print(f"Page size: {page_size}, Max docs: {max_docs or 'unlimited'}\n")

    all_docs = []
    last_doc = None
    total_fetched = 0

    try:
        while True:
            # Build query with pagination
            query = db.collection(collection_name).limit(page_size)

            if last_doc:
                query = query.start_after(last_doc)

            # Fetch batch
            docs = list(query.stream())

            if not docs:
                break

            batch_count = len(docs)
            total_fetched += batch_count
            all_docs.extend(docs)

            print(f"Fetched batch: {batch_count} docs | Total so far: {total_fetched}")

            # Check if we've reached max_docs limit
            if max_docs and total_fetched >= max_docs:
                print(f"Reached maximum document limit: {max_docs}")
                break

            # Set last document for next iteration
            last_doc = docs[-1]

            # If we got fewer docs than page_size, we've reached the end
            if batch_count < page_size:
                break

        print(f"\n✅ Total documents fetched: {len(all_docs)}")

        # Show first 3 documents as sample
        if all_docs:
            print("\nSample documents (first 3):")
            for doc in all_docs[:3]:
                print(f"- {doc.id}: {json.dumps(doc.to_dict(), default=str)[:100]}...")

        return all_docs

    except Exception as e:
        print(f"❌ Error pulling all data: {e}")
        import traceback
        traceback.print_exc()
        return all_docs


def pull_recent_data(hours=24, field_name="timestamp"):
    """
    Pull only documents modified/added in the last N hours.
    Requires a timestamp field in your documents.

    Args:
        hours: Number of hours to look back
        field_name: Name of the timestamp field (default: 'timestamp')
    """
    print(f"\n=== Strategy 2: Pull data from last {hours} hours ===")
    print(f"Using field: '{field_name}'\n")

    try:
        # Calculate cutoff time (in milliseconds since epoch)
        cutoff_time = datetime.now() - timedelta(hours=hours)
        cutoff_timestamp = int(cutoff_time.timestamp() * 1000)

        print(f"Cutoff time: {cutoff_time.strftime('%Y-%m-%d %H:%M:%S')}")
        print(f"Cutoff timestamp: {cutoff_timestamp}\n")

        # Query documents with timestamp greater than cutoff
        docs = list(
            db.collection(collection_name)
            .where(field_name, ">=", cutoff_timestamp)
            .stream()
        )

        print(f"✅ Found {len(docs)} document(s) modified/added in last {hours} hours")

        if docs:
            print("\nSample documents:")
            for doc in docs[:5]:
                data = doc.to_dict()
                ts = data.get(field_name, 'N/A')
                print(f"- {doc.id}: timestamp={ts}, data={json.dumps(data, default=str)[:80]}...")

        return docs

    except Exception as e:
        print(f"❌ Error pulling recent data: {e}")
        print(f"Note: This requires a Firestore index on '{field_name}' field")
        import traceback
        traceback.print_exc()
        return []


def setup_realtime_listener(callback=None):
    """
    Set up a real-time listener that monitors for added/modified documents.
    This will continuously watch for changes in the collection.

    Args:
        callback: Optional callback function to process each change
    """
    print(f"\n=== Strategy 3: Real-time listener for changes ===")
    print("Listening for new/modified documents... (Press Ctrl+C to stop)\n")

    def on_snapshot(col_snapshot, changes, read_time):
        """Callback for document changes"""
        for change in changes:
            doc = change.document
            if change.type.name == 'ADDED':
                print(f"➕ ADDED: {doc.id}")
                if callback:
                    callback('added', doc)
                else:
                    print(f"   Data: {json.dumps(doc.to_dict(), default=str)[:100]}...")

            elif change.type.name == 'MODIFIED':
                print(f"✏️  MODIFIED: {doc.id}")
                if callback:
                    callback('modified', doc)
                else:
                    print(f"   Data: {json.dumps(doc.to_dict(), default=str)[:100]}...")

            elif change.type.name == 'REMOVED':
                print(f"🗑️  REMOVED: {doc.id}")
                if callback:
                    callback('removed', doc)

    try:
        # Attach the listener
        col_ref = db.collection(collection_name)
        col_watch = col_ref.on_snapshot(on_snapshot)

        # Keep the listener running
        import time
        while True:
            time.sleep(1)

    except KeyboardInterrupt:
        print("\n\n⏹️  Listener stopped by user")
    except Exception as e:
        print(f"❌ Error with real-time listener: {e}")
        import traceback
        traceback.print_exc()


def export_to_json(docs, output_file="firestore_export.json"):
    """
    Export documents to a JSON file.

    Args:
        docs: List of document snapshots
        output_file: Output filename
    """
    print(f"\n=== Exporting to {output_file} ===")

    try:
        data = []
        for doc in docs:
            data.append({
                "id": doc.id,
                "data": doc.to_dict()
            })

        with open(output_file, 'w') as f:
            json.dump(data, f, indent=2, default=str)

        print(f"✅ Exported {len(data)} documents to {output_file}")

    except Exception as e:
        print(f"❌ Error exporting: {e}")


if __name__ == "__main__":
    import sys

    print("=" * 60)
    print("Firestore Data Puller")
    print("=" * 60)

    if len(sys.argv) > 1:
        strategy = sys.argv[1]
    else:
        print("\nAvailable strategies:")
        print("1. all       - Pull ALL data with pagination")
        print("2. recent    - Pull data from last 24 hours")
        print("3. listen    - Real-time listener for changes")
        print("\nUsage: python firestore_data_puller.py [strategy]")
        print("Example: python firestore_data_puller.py all")
        strategy = input("\nEnter strategy (1, 2, or 3): ").strip()

    if strategy in ['1', 'all']:
        # Pull all data with pagination
        docs = pull_all_data_paginated(page_size=1000, max_docs=10000)  # Limit to 10k for safety

        if docs:
            try:
                export_choice = input("\nExport to JSON? (y/n): ").strip().lower()
                if export_choice == 'y':
                    export_to_json(docs, f"firestore_export_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json")
            except (EOFError, KeyboardInterrupt):
                print("\nSkipping export.")

    elif strategy in ['2', 'recent']:
        # Pull recent data
        try:
            hours = input("How many hours back? (default: 24): ").strip()
            hours = int(hours) if hours else 24
        except (EOFError, ValueError):
            hours = 24

        docs = pull_recent_data(hours=hours)

        if docs:
            try:
                export_choice = input("\nExport to JSON? (y/n): ").strip().lower()
                if export_choice == 'y':
                    export_to_json(docs, f"firestore_recent_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json")
            except (EOFError, KeyboardInterrupt):
                print("\nSkipping export.")

    elif strategy in ['3', 'listen']:
        # Set up real-time listener
        setup_realtime_listener()

    else:
        print("❌ Invalid strategy. Please choose 1, 2, or 3.")

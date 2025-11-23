# Firestore -> Kinesis Listener

Files:
- `listener.py`

Dependencies
1. Python 3.9+
2. Install dependencies:
   pip install -r requirements.txt
   or
   pip install python-dotenv firebase-admin boto3

Environment (.env)
Set the following variables in a `.env` file or your environment:

SERVICE_ACCOUNT_FILE=/full/path/to/serviceAccount.json
FIRESTORE_COLLECTION=your-collection-name
KINESIS_STREAM=your-kinesis-stream-name

AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY
AWS_REGION=us-east-1

Optional:
MAX_WORKERS=8

Run locally
1. Ensure Firestore service account JSON is available and `SERVICE_ACCOUNT_FILE` points to it.
2. Ensure AWS credentials and Kinesis stream exist.
3. Start listener:
   python listener.py

Test Firestore → Kinesis events
1. With the listener running, add a new document to the specified Firestore collection (do NOT edit existing documents):
   - Use Firebase console to add a new document
   - Or use Firestore SDK / gcloud to create a document in the collection
2. The listener will only process documents added after it was started. Each new document will be serialized to JSON (UTF-8) with `_id` set to the document ID and sent to the Kinesis stream with `PartitionKey` = document ID.
3. Check Kinesis (e.g., using consumer or CloudWatch) to verify the record arrival.

Graceful shutdown: Ctrl+C (SIGINT)
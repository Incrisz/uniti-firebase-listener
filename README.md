# Firestore → Kinesis Listener

Python script that watches a Firestore collection in real time and forwards each document change into an AWS Kinesis stream.

## How it works
- Loads AWS credentials and stream name from `.env`.
- Initializes Firebase Admin using the service account file specified in `SERVICE_ACCOUNT_FILE` (default `serviceAccount.json`).
- Subscribes to the Firestore collection in `FIRESTORE_COLLECTION` (default `app_usage_logs`).
- On every add/modify/delete, packages the document data and sends it to the configured Kinesis stream.

## Setup
1) Ensure Python 3.10+ is installed.
2) Place your Firebase service account JSON in the project root (or set `SERVICE_ACCOUNT_FILE` in `.env`).
3) Copy `.env.example` to `.env` and fill in AWS creds, `AWS_DEFAULT_REGION`, `KINESIS_STREAM`, and `FIRESTORE_COLLECTION`.
4) Install dependencies: `python -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt`.
5) Run the listener: `python listener.py`.

## Docker
- Build: `docker build -t firestore-kinesis-listener .`
- Run (mount creds and load env):  
  `docker run --env-file .env -v $(pwd)/serviceAccount.json:/app/serviceAccount.json:ro firestore-kinesis-listener`
- Override the Firestore collection: add `-e FIRESTORE_COLLECTION=your_collection`.
- Stop: `docker ps` to find the container ID/name, then `docker stop <id>`.

## Notes
- The listener runs indefinitely; stop with `Ctrl+C` (or stop the container).
- Use IAM credentials that can write to the target Kinesis stream.


 docker build -t firestore-kinesis-listener .

 docker run -d --restart unless-stopped --name firestore-listener --env-file .env -v "$(pwd)/uniti-production-firebase-adminsdk.json:/app/serviceAccount.json:ro" firestore-kinesis-listener# uniti-firebase-listener

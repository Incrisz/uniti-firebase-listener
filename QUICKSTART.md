# Firestore → Kinesis Sync - Quick Start

## What This Does
✅ **Watches** Firestore collection for changes **in real-time**
✅ Sends added/modified documents to AWS Kinesis in **JSON format**
✅ **Runs continuously** until you stop it (Ctrl+C)
✅ **No JSON file exports** - Direct to Kinesis only

---

## Usage

### Run the Listener (Continuous)
```bash
python firestore_kinesis_sync.py
```

### What Happens:
1. **Connects** to Firestore and Kinesis
2. **Starts listening** for document changes
3. **Watches continuously** - detects changes instantly
4. **Sends to Kinesis** as they happen
5. **Runs forever** until you press Ctrl+C

---

## Configuration (Already Set in .env)

```bash
# Firestore
FIRESTORE_COLLECTION=app_usage_logs                    ✅
SERVICE_ACCOUNT_FILE=uniti-production-firebase-adminsdk.json  ✅

# AWS Kinesis
KINESIS_STREAM=prod-firestore-events                   ✅
AWS_ACCESS_KEY_ID=AKIASK35G5RKZJSJSPMD                 ✅
AWS_SECRET_ACCESS_KEY=***                              ✅
AWS_DEFAULT_REGION=us-east-1                           ✅
```

---

## Kinesis Event Format

Each document sent to Kinesis:

```json
{
  "eventType": "MODIFIED",
  "collection": "app_usage_logs",
  "documentId": "abc123xyz",
  "data": {
    "timestamp": 1763706945123,
    "userId": "user123",
    "packageName": "com.example.app",
    ...
  },
  "timestamp": "2025-11-21T07:15:45.123456",
  "sync_source": "incremental_sync"
}
```

---

## Run as Background Service

### Option 1: Simple Background Process
```bash
# Run in background
nohup python firestore_kinesis_sync.py > kinesis_sync.log 2>&1 &

# Check if running
ps aux | grep firestore_kinesis_sync

# Stop it
pkill -f firestore_kinesis_sync.py
```

### Option 2: Systemd Service (Recommended)
Create `/etc/systemd/system/firestore-kinesis-sync.service`:
```ini
[Unit]
Description=Firestore to Kinesis Real-time Sync
After=network.target

[Service]
Type=simple
User=cloud
WorkingDirectory=/home/cloud/Videos/uniti-firebase-listener
ExecStart=/home/cloud/Videos/uniti-firebase-listener/.venv/bin/python firestore_kinesis_sync.py
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

Then:
```bash
sudo systemctl daemon-reload
sudo systemctl enable firestore-kinesis-sync
sudo systemctl start firestore-kinesis-sync
sudo systemctl status firestore-kinesis-sync
```

---

## Reset and Start Fresh

```bash
rm .last_sync_timestamp
python firestore_kinesis_sync.py
```

---

## Monitor

```bash
# View logs
tail -f kinesis_sync.log

# Check last sync
cat .last_sync_timestamp

# Check Kinesis stream
aws kinesis describe-stream --stream-name prod-firestore-events
```

---

## Features

✅ **Real-time** - Instant change detection
✅ **Continuous** - Runs until stopped
✅ **Automatic tracking** - No manual timestamp management
✅ **Kinesis direct** - JSON sent directly to stream
✅ **Error handling** - Continues on failures
✅ **Statistics** - Shows total sent on exit
✅ **Production ready** - Systemd service support

---

## Stopping the Listener

```bash
# If running in foreground
Press Ctrl+C

# If running in background
pkill -f firestore_kinesis_sync.py

# If running as systemd service
sudo systemctl stop firestore-kinesis-sync
```

---

## Files

- **[firestore_kinesis_sync.py](firestore_kinesis_sync.py)** - Main real-time sync script
- **.last_sync_timestamp** - Tracks last sync (auto-generated)
- **[README_REALTIME_SYNC.md](README_REALTIME_SYNC.md)** - Full documentation
- **[QUICKSTART.md](QUICKSTART.md)** - This file

---

**You're all set!** 🚀 Just run `python firestore_kinesis_sync.py` and it will watch for changes continuously!

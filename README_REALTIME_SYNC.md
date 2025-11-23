# Firestore → Kinesis Real-time Sync

## Overview
**Continuously watches Firestore collection for changes and sends them to AWS Kinesis in real-time.**

This script runs **continuously** until you stop it (Ctrl+C). It uses Firestore's real-time listener to detect new, modified, and removed documents instantly and sends them to your Kinesis stream.

---

## 🚀 Quick Start

### Run the Listener
```bash
python firestore_kinesis_sync.py
```

### Output:
```
============================================================
🔄 FIRESTORE → KINESIS REAL-TIME SYNC
============================================================
📡 Firebase Project: uniti-production
📂 Firestore Collection: app_usage_logs
🌊 Kinesis Stream: prod-firestore-events
🌍 AWS Region: us-east-1
============================================================
✅ Kinesis stream 'prod-firestore-events' is ACTIVE

👂 Starting real-time listener...
   Watching for ADDED, MODIFIED, and REMOVED documents
   Press Ctrl+C to stop

✅ Listener active! Monitoring Firestore for changes...

[Waits for changes...]

➕ NEW: abc123xyz
   ✅ Sent to Kinesis | Total: 1

✏️  MODIFIED: def456uvw
   ✅ Sent to Kinesis | Total: 2

```

### Stop the Listener:
Press **Ctrl+C** to stop gracefully:
```
^C
============================================================
⏹️  STOPPED BY USER
============================================================

📊 Session Statistics:
   Runtime: 2:15:33
   ✅ Documents sent to Kinesis: 145
   ❌ Failed to send: 0

💾 Last sync timestamp saved in: .last_sync_timestamp
```

---

## ⚙️ Configuration

### Environment Variables (.env)
```bash
# Firestore
FIRESTORE_COLLECTION=app_usage_logs
SERVICE_ACCOUNT_FILE=uniti-production-firebase-adminsdk.json

# AWS Kinesis
KINESIS_STREAM=prod-firestore-events
AWS_ACCESS_KEY_ID=AKIAXXX...
AWS_SECRET_ACCESS_KEY=secret...
AWS_DEFAULT_REGION=us-east-1

# Optional: Custom timestamp tracking file
LAST_SYNC_FILE=.last_sync_timestamp
```

---

## 🔄 How It Works

### Real-time Listener
The script uses Firestore's **`on_snapshot`** listener:
1. Connects to Firestore collection
2. Registers a callback for document changes
3. Waits indefinitely for events
4. When a document is added/modified/removed:
   - Instantly detects the change
   - Sends to Kinesis in JSON format
   - Updates local timestamp
5. Continues monitoring until stopped

### Event Types
- **ADDED** - New document created
- **MODIFIED** - Existing document updated
- **REMOVED** - Document deleted

### Query Filtering (Important!)
To handle large collections efficiently:
- **With last_sync_timestamp**: Only watches documents with `timestamp > last_sync`
- **First run (no timestamp)**: Only watches documents from last 24 hours
- This prevents timeout errors on collections with millions of documents

The listener only monitors documents matching the filter, making it efficient and scalable.

### Why Filtering is Necessary
Firestore real-time listeners can timeout when watching entire large collections. By filtering to only watch recent documents, we:
- ✅ Avoid timeout errors
- ✅ Reduce network overhead
- ✅ Improve performance
- ✅ Only monitor relevant new/modified documents

---

## 🌊 Kinesis Event Format

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
    "deviceModel": "samsung SM-A165F",
    ...
  },
  "timestamp": "2025-11-21T07:15:45.123456",
  "sync_source": "incremental_sync"
}
```

---

## 🤖 Running as a Service

### Systemd Service (Recommended for Production)

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
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
```

Enable and start:
```bash
sudo systemctl daemon-reload
sudo systemctl enable firestore-kinesis-sync
sudo systemctl start firestore-kinesis-sync
```

Check status:
```bash
sudo systemctl status firestore-kinesis-sync
```

View logs:
```bash
sudo journalctl -u firestore-kinesis-sync -f
```

Stop service:
```bash
sudo systemctl stop firestore-kinesis-sync
```

---

## 📊 Monitoring

### Check if Running
```bash
ps aux | grep firestore_kinesis_sync
```

### View Logs (if using systemd)
```bash
# Real-time logs
sudo journalctl -u firestore-kinesis-sync -f

# Last 100 lines
sudo journalctl -u firestore-kinesis-sync -n 100

# Logs since today
sudo journalctl -u firestore-kinesis-sync --since today
```

### Monitor Kinesis Stream
```bash
# Check stream status
aws kinesis describe-stream --stream-name prod-firestore-events

# Get shard iterator and read records
aws kinesis get-shard-iterator \
  --stream-name prod-firestore-events \
  --shard-id shardId-000000000000 \
  --shard-iterator-type LATEST
```

---

## 🐛 Troubleshooting

### Issue: "Cannot access Kinesis stream"
**Solution:**
```bash
# Test AWS credentials
aws kinesis describe-stream --stream-name prod-firestore-events

# Check IAM permissions
# Required: kinesis:PutRecord, kinesis:DescribeStream
```

### Issue: Listener stops unexpectedly
**Possible causes:**
- Network connection lost
- AWS credentials expired
- Firestore quota exceeded

**Solution:**
- Use systemd service (auto-restart on failure)
- Check logs for specific error
- Verify credentials and quotas

### Issue: Duplicate events on restart
**Expected behavior:**
- The listener will see ALL documents on first connection
- Filter prevents re-sending old documents (using timestamp)
- Only NEW changes after startup are sent to Kinesis

**If seeing duplicates:**
- Check `.last_sync_timestamp` file
- Verify document timestamps are correct
- Consider deleting timestamp file to start fresh

### Issue: High CPU usage
**Solution:**
- Normal for real-time listener
- Idle CPU: ~1-5%
- Active (processing events): ~10-30%
- If consistently high, check for excessive document changes

---

## 🔑 Key Features

✅ **Real-time** - Instant detection of changes
✅ **Continuous** - Runs until stopped
✅ **Automatic restart** - With systemd service
✅ **Timestamp filtering** - Prevents duplicate sends on restart
✅ **Statistics** - Shows total sent/failed on exit
✅ **Error handling** - Continues on individual failures
✅ **Production-ready** - Tested and verified

---

## 📝 Differences from Other Scripts

| Feature | kinesis_sync.py (Real-time) | incremental_sync.py | data_puller.py |
|---------|----------------------------|---------------------|----------------|
| **Mode** | Continuous | One-shot | One-shot |
| **Detection** | Real-time listener | Query on demand | Query on demand |
| **Runs until** | Ctrl+C | Completes | Completes |
| **Best for** | Production monitoring | Scheduled jobs | Manual exports |
| **Latency** | Instant | Minutes (cron interval) | N/A |
| **Resource usage** | Constant (low) | Burst | Burst |

---

## ⚠️ Important Notes

1. **Runs continuously** - Does NOT exit unless you stop it
2. **Requires network** - Must maintain connection to Firebase and AWS
3. **Timestamp required** - Documents must have `timestamp` field
4. **Kinesis quotas** - Monitor your Kinesis limits (1000 records/sec per shard)
5. **First run** - Will see all existing documents (filtered by timestamp)
6. **Restart behavior** - Uses timestamp file to skip old documents

---

## 🚦 Production Checklist

Before deploying to production:

- [ ] Test with small dataset first
- [ ] Verify Kinesis stream can handle load
- [ ] Set up systemd service for auto-restart
- [ ] Configure log rotation
- [ ] Set up CloudWatch alerts for Kinesis
- [ ] Monitor CPU and memory usage
- [ ] Test graceful shutdown (Ctrl+C)
- [ ] Verify timestamp filtering works
- [ ] Document recovery procedures
- [ ] Set up monitoring/alerting

---

## 📚 Related Files

- **[QUICKSTART.md](QUICKSTART.md)** - Quick reference
- **[README_KINESIS_SYNC.md](README_KINESIS_SYNC.md)** - Original one-shot sync docs
- **[firestore_kinesis_sync.py](firestore_kinesis_sync.py)** - Main script

---

## Summary

✅ **Real-time monitoring** - Instant change detection
✅ **Runs continuously** - Until you stop it
✅ **Direct to Kinesis** - No file exports
✅ **Production-ready** - Systemd service support
✅ **Automatic filtering** - Prevents duplicate sends

**Perfect for production pipelines!** 🚀

---

**Last updated:** 2025-11-21

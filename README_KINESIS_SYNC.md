# Firestore → Kinesis Incremental Sync

## Overview
**Automatically pulls only new/modified Firestore documents and sends them to AWS Kinesis stream.**

This is the production-ready script for continuous Firestore → Kinesis syncing. It tracks the last sync timestamp and only processes documents that have been added or modified since the last run.

---

## 🚀 Quick Start

### Basic Usage
```bash
python firestore_kinesis_sync.py
```

That's it! The script will:
1. ✅ Check connection to Kinesis stream
2. ✅ Pull only new/modified documents since last run
3. ✅ Send each document to Kinesis
4. ✅ Save timestamp for next run

---

## ⚙️ Configuration

### Required Environment Variables (.env)
```bash
# Firebase Configuration
FIRESTORE_COLLECTION=app_usage_logs
SERVICE_ACCOUNT_FILE=uniti-production-firebase-adminsdk.json

# AWS Kinesis Configuration
KINESIS_STREAM=prod-firestore-events
AWS_ACCESS_KEY_ID=AKIAXXX...
AWS_SECRET_ACCESS_KEY=secret...
AWS_DEFAULT_REGION=us-east-1
```

### Optional Environment Variables
```bash
# Custom timestamp tracking file (default: .last_sync_timestamp)
LAST_SYNC_FILE=.last_sync_timestamp

# Enable JSON backup export alongside Kinesis (default: false)
ENABLE_JSON_EXPORT=true

# Custom output directory for JSON backups (default: sync_output)
SYNC_OUTPUT_DIR=sync_output
```

---

## 📊 How It Works

### First Run
```
🆕 First run - no previous sync timestamp found
⚠️  Pulling ALL data (limited to 10,000 docs for safety)

  📦 Progress: 100 docs processed | ✅ 100 sent | ❌ 0 failed
  📦 Progress: 200 docs processed | ✅ 200 sent | ❌ 0 failed
  ...

✅ Total documents processed: 10000
✅ Successfully sent to Kinesis: 10000
✅ Saved sync timestamp: 2025-11-21 07:15:45
```

### Subsequent Runs
```
📋 Last sync: 2025-11-21 07:15:45 (timestamp: 1763706945123)
📅 Pulling documents modified after: 2025-11-21 07:15:45

  📦 Progress: 100 docs processed | ✅ 100 sent | ❌ 0 failed
  📦 Progress: 150 docs processed | ✅ 150 sent | ❌ 0 failed

✅ Total documents processed: 150
✅ Successfully sent to Kinesis: 150
```

### When No New Data
```
📋 Last sync: 2025-11-21 07:15:45
📅 Pulling documents modified after: 2025-11-21 07:15:45

✅ Total documents processed: 0
✨ No new documents since last sync - everything is up to date!
```

---

## 🔄 Event Format

Each document is sent to Kinesis in this format:

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

**Event Types:**
- `ADDED` - Document added during first sync
- `MODIFIED` - Document modified since last sync
- `REMOVED` - Document removed (future feature)

---

## 🤖 Automation

### Cron Job (Recommended)

**Every Hour:**
```bash
crontab -e

# Add this line
0 * * * * cd /path/to/project && /path/to/.venv/bin/python firestore_kinesis_sync.py >> kinesis_sync.log 2>&1
```

**Every 15 Minutes:**
```bash
*/15 * * * * cd /path/to/project && /path/to/.venv/bin/python firestore_kinesis_sync.py >> kinesis_sync.log 2>&1
```

**Every 5 Minutes:**
```bash
*/5 * * * * cd /path/to/project && /path/to/.venv/bin/python firestore_kinesis_sync.py >> kinesis_sync.log 2>&1
```

### Systemd Service

Create `/etc/systemd/system/firestore-kinesis-sync.timer`:
```ini
[Unit]
Description=Firestore to Kinesis Sync Timer
Requires=firestore-kinesis-sync.service

[Timer]
OnBootSec=5min
OnUnitActiveSec=15min

[Install]
WantedBy=timers.target
```

Create `/etc/systemd/system/firestore-kinesis-sync.service`:
```ini
[Unit]
Description=Firestore to Kinesis Sync Service
After=network.target

[Service]
Type=oneshot
User=youruser
WorkingDirectory=/path/to/project
ExecStart=/path/to/.venv/bin/python firestore_kinesis_sync.py
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
```

Enable and start:
```bash
sudo systemctl enable firestore-kinesis-sync.timer
sudo systemctl start firestore-kinesis-sync.timer
sudo systemctl status firestore-kinesis-sync.timer
```

---

## 📦 Features

### ✅ Automatic Timestamp Tracking
- Saves last sync timestamp to `.last_sync_timestamp`
- No manual tracking needed
- Survives restarts

### ✅ Incremental Sync
- Only downloads new/modified documents
- Efficient - doesn't re-process old data
- Uses Firestore `WHERE timestamp > last_sync` query

### ✅ Kinesis Integration
- Verifies stream connection before syncing
- Sends each document individually
- Uses document ID as partition key
- Handles Kinesis errors gracefully

### ✅ Progress Tracking
- Real-time progress every 100 documents
- Shows success/failure counts
- Final summary report

### ✅ Error Handling
- Continues on individual document failures
- Reports failed sends in summary
- Full error logging

### ✅ Optional JSON Backup
- Enable with `ENABLE_JSON_EXPORT=true`
- Creates timestamped backup files
- Useful for auditing and debugging

---

## 🐛 Troubleshooting

### Issue: "Cannot access Kinesis stream"

**Possible Causes:**
- Invalid AWS credentials
- Incorrect stream name
- Missing IAM permissions
- Wrong AWS region

**Solution:**
```bash
# Test AWS credentials
aws kinesis describe-stream --stream-name prod-firestore-events --region us-east-1

# Check .env file
cat .env | grep -E "(KINESIS|AWS)"

# Verify IAM permissions include:
# - kinesis:PutRecord
# - kinesis:DescribeStream
```

### Issue: "Some documents failed to send"

**Possible Causes:**
- Kinesis throughput limits exceeded
- Document size too large (>1MB)
- Network issues

**Solution:**
```bash
# Check Kinesis metrics in AWS Console
# Increase shard count if needed
# Consider batching with put_records() for higher throughput
```

### Issue: "No new documents" but expecting data

**Checklist:**
- ✅ Documents have `timestamp` field?
- ✅ Timestamp is in milliseconds (not seconds)?
- ✅ Check `.last_sync_timestamp` value
- ✅ Try resetting: `rm .last_sync_timestamp`

### Issue: First run only synced 10,000 docs

**Solution:** This is a safety limit. To remove it, edit line 203:

```python
# Current (safe)
max_docs = 10000

# Change to (unlimited)
max_docs = None
```

Or use `firestore_data_puller.py` for full initial load:
```bash
python firestore_data_puller.py all
```

---

## 📊 Performance

- **10 docs/sec** → 600 docs/minute
- **100 docs/sec** → 6,000 docs/minute (requires more shards)
- **Progress updates** every 100 documents
- **Kinesis limits:** 1,000 records/sec per shard, 1MB/sec per shard

For higher throughput, consider:
1. Increase Kinesis shard count
2. Use batch sending (put_records)
3. Implement parallel processing

---

## 🔍 Monitoring

### Check Sync Status
```bash
# View last sync info
cat .last_sync_timestamp

# View sync logs
tail -f kinesis_sync.log
```

### Monitor Kinesis
```bash
# Check stream status
aws kinesis describe-stream --stream-name prod-firestore-events

# Monitor records
aws kinesis get-records --shard-iterator $(aws kinesis get-shard-iterator \
  --stream-name prod-firestore-events \
  --shard-id shardId-000000000000 \
  --shard-iterator-type LATEST --query 'ShardIterator' --output text)
```

### Logs to Watch
- **Success rate:** `✅ Successfully sent to Kinesis: X`
- **Failure rate:** `❌ Failed to send: X`
- **Processing time:** Track time between runs
- **Document count:** Monitor for anomalies

---

## 🔄 Comparison with Other Scripts

| Feature | kinesis_sync.py ⭐ | incremental_sync.py | data_puller.py |
|---------|-------------------|---------------------|----------------|
| **Kinesis integration** | ✅ Built-in | ❌ No | ❌ No |
| **Auto tracking** | ✅ Yes | ✅ Yes | ❌ No |
| **Incremental sync** | ✅ Yes | ✅ Yes | Partial |
| **Production-ready** | ✅ Yes | ✅ Yes | Partial |
| **JSON export** | Optional | ✅ Yes | ✅ Yes |
| **Use case** | Kinesis pipeline | JSON export | Manual export |

---

## 💡 Best Practices

### For Production
1. ✅ Enable monitoring and alerting
2. ✅ Set up cron job or systemd timer
3. ✅ Monitor Kinesis CloudWatch metrics
4. ✅ Keep `ENABLE_JSON_EXPORT=false` (unless needed for auditing)
5. ✅ Test with small datasets first
6. ✅ Set up log rotation for `kinesis_sync.log`

### For Development
1. ✅ Use `ENABLE_JSON_EXPORT=true` for debugging
2. ✅ Start with small sync intervals
3. ✅ Monitor `.last_sync_timestamp` changes
4. ✅ Test with both new and modified documents

---

## 🚨 Important Notes

- **First run limitation:** Limited to 10,000 docs for safety
- **Timestamp requirement:** Documents MUST have a `timestamp` field
- **Kinesis costs:** Pay per PUT request + data transfer
- **IAM permissions:** Ensure proper Kinesis access
- **Network:** Stable internet connection required
- **Idempotency:** Sending same document multiple times is safe

---

## 📚 Related Scripts

- **[firestore_check.py](firestore_check.py)** - Test Firestore connection
- **[firestore_data_puller.py](firestore_data_puller.py)** - Manual data export
- **[firestore_incremental_sync.py](firestore_incremental_sync.py)** - JSON-only sync

---

## Summary

✅ **Firestore → Kinesis** - Direct integration
✅ **Automatic tracking** - No manual work
✅ **Incremental only** - Efficient syncing
✅ **Production-ready** - Error handling, monitoring
✅ **Easy automation** - Cron/systemd support

**Perfect for real-time data pipelines!** 🚀

---

**Last updated:** 2025-11-21

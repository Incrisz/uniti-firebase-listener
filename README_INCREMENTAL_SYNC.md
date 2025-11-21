# Firestore Incremental Sync

## Overview
This script **automatically tracks and pulls only added or modified documents** since the last run. Perfect for continuous data syncing without re-downloading everything.

---

## How It Works

### First Run
1. **No previous sync found** → Pulls all data (limited to 10,000 docs for safety)
2. Saves the latest timestamp to `.last_sync_timestamp`
3. Exports data to `sync_output/incremental_sync_YYYYMMDD_HHMMSS.json`

### Subsequent Runs
1. **Reads last sync timestamp** from `.last_sync_timestamp`
2. Queries Firestore: `WHERE timestamp > last_sync_timestamp`
3. Pulls **ONLY new/modified documents** since last run
4. Updates timestamp for next run
5. Exports only the new data

---

## Quick Start

### Basic Usage
```bash
python firestore_incremental_sync.py
```

That's it! Run this command:
- **First time:** Pulls initial dataset (10k docs)
- **Every time after:** Pulls only new/modified data

---

## Example Output

### First Run
```
🔄 FIRESTORE INCREMENTAL SYNC
============================================================
📡 Connected to project: uniti-production
📂 Collection: app_usage_logs
🆕 First run - no previous sync timestamp found

🔄 Starting incremental sync...
  📦 Fetched batch: 1000 docs | Total: 1000
  📦 Fetched batch: 1000 docs | Total: 2000
  ...
✅ Total new/modified documents: 10000

💾 Exported 10000 document(s) to: sync_output/incremental_sync_20251121_070943.json
   File size: 6.4 MB
✅ Saved sync timestamp: 2025-11-21 06:26:38
```

### Second Run (No New Data)
```
📋 Last sync: 2025-11-21 06:26:38 (timestamp: 1763702798204)

🔄 Starting incremental sync...
📅 Pulling documents modified after: 2025-11-21 06:26:38
   (timestamp > 1763702798204)

✅ Total new/modified documents: 0

✨ No new documents since last sync - everything is up to date!
```

### Second Run (With New Data)
```
📋 Last sync: 2025-11-21 06:26:38

🔄 Starting incremental sync...
📅 Pulling documents modified after: 2025-11-21 06:26:38

  📦 Fetched batch: 150 docs | Total: 150

✅ Total new/modified documents: 150

💾 Exported 150 document(s) to: sync_output/incremental_sync_20251121_073045.json
   File size: 92.3 KB
```

---

## Configuration

### Environment Variables (.env)
```bash
# Firestore settings
FIRESTORE_COLLECTION=app_usage_logs
SERVICE_ACCOUNT_FILE=uniti-production-firebase-adminsdk.json

# Optional: Custom paths
LAST_SYNC_FILE=.last_sync_timestamp
SYNC_OUTPUT_DIR=sync_output
```

### Changing the Timestamp Field
If your documents use a different timestamp field (not `timestamp`), modify line 135:

```python
# Default
docs = pull_incremental_data(last_timestamp)

# Custom field
docs = pull_incremental_data(last_timestamp, timestamp_field="createdAt")
```

---

## File Structure

### Generated Files
```
project/
├── firestore_incremental_sync.py   # The script
├── .last_sync_timestamp             # Tracks last sync (JSON)
└── sync_output/                     # Exported data
    ├── incremental_sync_20251121_070943.json  # First run
    ├── incremental_sync_20251121_073045.json  # Second run
    └── incremental_sync_20251121_080120.json  # Third run
```

### Timestamp File Format
```json
{
  "last_sync_timestamp": 1763702798204,
  "last_sync_datetime": "2025-11-21 06:26:38",
  "collection": "app_usage_logs",
  "project": "uniti-production"
}
```

### Export File Format
```json
{
  "sync_info": {
    "collection": "app_usage_logs",
    "sync_datetime": "2025-11-21 07:30:45",
    "document_count": 150,
    "project": "uniti-production"
  },
  "documents": [
    {
      "id": "abc123",
      "data": {
        "timestamp": 1763705445123,
        "userId": "user123",
        ...
      }
    }
  ]
}
```

---

## Automation

### Run Every Hour (Cron)
```bash
# Edit crontab
crontab -e

# Add this line (runs every hour)
0 * * * * cd /path/to/project && /path/to/.venv/bin/python firestore_incremental_sync.py >> sync.log 2>&1
```

### Run Every 15 Minutes
```bash
*/15 * * * * cd /path/to/project && /path/to/.venv/bin/python firestore_incremental_sync.py >> sync.log 2>&1
```

### Run as Systemd Service (Continuous)
Create `/etc/systemd/system/firestore-sync.service`:
```ini
[Unit]
Description=Firestore Incremental Sync
After=network.target

[Service]
Type=simple
User=youruser
WorkingDirectory=/path/to/project
ExecStart=/path/to/.venv/bin/python firestore_incremental_sync.py
Restart=always
RestartSec=3600

[Install]
WantedBy=multi-user.target
```

Enable and start:
```bash
sudo systemctl enable firestore-sync
sudo systemctl start firestore-sync
```

---

## Troubleshooting

### Issue: "No timestamp field found in documents"
**Solution:** Your documents must have a `timestamp` field (in milliseconds since epoch)
- Check your document structure
- Or specify a custom field: `pull_incremental_data(last_timestamp, timestamp_field="createdAt")`

### Issue: "The query requires an index"
**Solution:**
1. The error message will include a URL
2. Click the URL to create the index in Firebase Console
3. Wait 1-2 minutes for the index to build
4. Run the script again

### Issue: Want to start fresh
**Solution:** Delete the timestamp file:
```bash
rm .last_sync_timestamp
```
Next run will be treated as first run.

### Issue: First run only pulled 10,000 docs
**Solution:** This is a safety limit. To pull all data on first run, modify line 112:

```python
# Current (safe)
max_docs = 10000

# Change to (unlimited)
max_docs = None
```

---

## Comparison with Other Scripts

| Feature | incremental_sync.py | firestore_data_puller.py | firestore_check.py |
|---------|---------------------|-------------------------|-------------------|
| **Auto-tracking** | ✅ Yes | ❌ No | ❌ No |
| **Only new data** | ✅ Yes | Manual | ❌ No |
| **Timestamp file** | ✅ Yes | ❌ No | ❌ No |
| **Automation-ready** | ✅ Yes | Partial | ❌ No |
| **Export format** | Detailed JSON | Simple JSON | Terminal only |
| **Best for** | Scheduled syncs | One-off exports | Testing connection |

---

## Advanced Usage

### Custom Output Processing
Modify the `export_incremental_data()` function to:
- Send to webhook
- Insert into database
- Process with pandas
- Upload to S3/GCS

Example:
```python
def export_incremental_data(docs, prefix="incremental"):
    # ... existing code ...

    # Custom processing
    for doc in docs:
        data = doc.to_dict()
        # Send to your API
        requests.post('https://your-api.com/webhook', json=data)

    return output_file
```

### Multiple Collections
Run separate instances for different collections:
```bash
FIRESTORE_COLLECTION=app_usage_logs LAST_SYNC_FILE=.sync_logs python firestore_incremental_sync.py
FIRESTORE_COLLECTION=user_events LAST_SYNC_FILE=.sync_events python firestore_incremental_sync.py
```

---

## Performance

- **First run (10k docs):** ~10 seconds
- **Incremental (100 new docs):** ~1-2 seconds
- **Incremental (0 new docs):** <1 second
- **Network overhead:** Minimal (only downloads new data)
- **Storage:** Each export is a separate JSON file

---

## Summary

✅ **Run once** → Pulls all data (first time)
✅ **Run again** → Pulls only new/modified data
✅ **Automatic tracking** → No manual timestamp management
✅ **Ready for automation** → Perfect for cron jobs
✅ **Efficient** → Only downloads what's needed

**Perfect for continuous data syncing workflows!**

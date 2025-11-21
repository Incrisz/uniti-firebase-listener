# Firestore Data Puller Guide

## Overview
This tool provides **3 strategies** to pull data from your Firestore collections, including the ability to pull **ALL data** or just **new/modified data**.

---

## Quick Start

### 1. Pull ALL Data (with Pagination)
```bash
python firestore_data_puller.py all
```
- **Fetches:** ALL documents from the collection
- **Method:** Pagination (1000 docs per batch)
- **Safety limit:** 10,000 documents (configurable)
- **Use case:** Full backups, migrations, complete exports

### 2. Pull Recent/Modified Data Only
```bash
python firestore_data_puller.py recent
```
- **Fetches:** Only documents from the last N hours (default: 24)
- **Method:** Query using timestamp field
- **Use case:** Incremental backups, syncing recent changes
- **Requirement:** Documents must have a `timestamp` field

### 3. Real-time Listener
```bash
python firestore_data_puller.py listen
```
- **Monitors:** Live changes to the collection
- **Detects:** ADDED, MODIFIED, and REMOVED documents
- **Use case:** Event-driven processing, real-time monitoring
- **Note:** Press Ctrl+C to stop

---

## Configuration

Edit your `.env` file:
```bash
FIRESTORE_COLLECTION=app_usage_logs
SERVICE_ACCOUNT_FILE=uniti-production-firebase-adminsdk.json
```

---

## Pulling ALL Data (No Limits)

To pull **all data** without the 10k limit, modify line 244 in `firestore_data_puller.py`:

```python
# Current (safe for testing):
docs = pull_all_data_paginated(page_size=1000, max_docs=10000)

# Change to (no limit):
docs = pull_all_data_paginated(page_size=1000, max_docs=None)
```

### Performance Estimates
- **10,000 docs:** ~10 seconds
- **100,000 docs:** ~2 minutes
- **1,000,000 docs:** ~20 minutes

---

## Export to JSON

Both Strategy 1 and 2 will prompt you to export results to JSON:
```bash
Export to JSON? (y/n): y
```

Output file format:
```
firestore_export_20251121_070530.json
firestore_recent_20251121_070530.json
```

---

## Advanced Examples

### Pull all data and auto-export
```python
docs = pull_all_data_paginated(page_size=1000, max_docs=None)
export_to_json(docs, "full_backup.json")
```

### Pull last 7 days only
```python
docs = pull_recent_data(hours=168)  # 24 * 7 = 168 hours
```

### Custom real-time callback
```python
def my_callback(change_type, doc):
    if change_type == 'added':
        # Send to webhook, database, etc.
        process_new_document(doc)

setup_realtime_listener(callback=my_callback)
```

---

## Troubleshooting

### Issue: "Query timed out"
**Solution:** Use pagination (Strategy 1) or add `.limit()` to queries

### Issue: "The query requires an index"
**Solution:**
1. Check the error message for the index URL
2. Click the URL to create the index in Firebase Console
3. Wait 1-2 minutes for index to build

### Issue: "No documents found with Strategy 2"
**Solution:**
- Verify your documents have a `timestamp` field
- Check the timestamp format (should be milliseconds since epoch)
- Try increasing the hours parameter

---

## Why Your Original Issue Happened

Your **uniti-production** collection has a large dataset (millions of documents). The original script tried to fetch all at once, causing:
1. **Timeout:** Query took too long to complete
2. **Retry error:** When Firestore tried to retry, it hit the `_retry` attribute bug

**The Fix:** Use pagination to fetch data in manageable batches (Strategy 1)

---

## Summary

| Strategy | Best For | Speed | Data Volume |
|----------|----------|-------|-------------|
| **1. Pull All** | Complete backups, migrations | Medium | Unlimited |
| **2. Pull Recent** | Incremental sync, recent changes | Fast | Limited by time range |
| **3. Real-time** | Live monitoring, event processing | Instant | Continuous |

✅ **Both JSON files work fine** - the issue was collection size, not credentials!

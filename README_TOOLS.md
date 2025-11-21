# Firestore Data Management Tools

Complete toolkit for connecting to, testing, and syncing data from Firebase Firestore collections.

---

## 📋 Table of Contents
- [Quick Start](#quick-start)
- [Available Tools](#available-tools)
- [Setup](#setup)
- [Common Tasks](#common-tasks)
- [Troubleshooting](#troubleshooting)

---

## 🚀 Quick Start

### 1. Install Dependencies
```bash
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

### 2. Configure Environment
Create `.env` file:
```bash
FIRESTORE_COLLECTION=app_usage_logs
SERVICE_ACCOUNT_FILE=uniti-production-firebase-adminsdk.json
AWS_ACCESS_KEY_ID=your_key
AWS_SECRET_ACCESS_KEY=your_secret
AWS_DEFAULT_REGION=us-east-1
```

### 3. Test Connection
```bash
python firestore_check.py
```

### 4. Start Syncing
```bash
python firestore_incremental_sync.py
```

---

## 🛠️ Available Tools

### 1. **firestore_check.py** - Connection Tester
**Purpose:** Verify Firestore credentials and connection

**Usage:**
```bash
python firestore_check.py
```

**Output:**
```
Checking Firestore connection... collection='app_usage_logs'
Using service account project_id='uniti-production'
Root collections: ['app_usage_events', 'app_usage_logs']
Retrieved 5 document(s) from 'app_usage_logs'.
```

**Best for:**
- Testing new credentials
- Verifying collection access
- Quick connection check

---

### 2. **firestore_data_puller.py** - Manual Data Export
**Purpose:** One-time data pulls with multiple strategies

**Usage:**
```bash
# Pull all data (paginated)
python firestore_data_puller.py all

# Pull recent data (last 24 hours)
python firestore_data_puller.py recent

# Real-time listener
python firestore_data_puller.py listen
```

**Features:**
- ✅ Pull ALL data with pagination
- ✅ Pull data from specific time range
- ✅ Real-time change monitoring
- ✅ Export to JSON

**Best for:**
- One-time full backups
- Ad-hoc data exports
- Monitoring live changes
- Testing queries

**See:** [README_DATA_PULLER.md](README_DATA_PULLER.md)

---

### 3. **firestore_incremental_sync.py** - Automated Incremental Sync ⭐
**Purpose:** Automatically track and pull only new/modified data

**Usage:**
```bash
python firestore_incremental_sync.py
```

**How it works:**
1. **First run:** Pulls all data (10k limit), saves timestamp
2. **Next runs:** Only pulls data modified after last sync
3. **Automatic:** No manual timestamp management needed

**Features:**
- ✅ Automatic timestamp tracking
- ✅ Only downloads new/modified documents
- ✅ Exports each sync to separate JSON file
- ✅ Perfect for automation (cron, systemd)
- ✅ Efficient (only downloads what's needed)

**Output Files:**
- `.last_sync_timestamp` - Tracks last sync
- `sync_output/incremental_sync_*.json` - Exported data

**Best for:**
- Scheduled data syncing (hourly, daily)
- Continuous integration pipelines
- Incremental backups
- Production workflows

**See:** [README_INCREMENTAL_SYNC.md](README_INCREMENTAL_SYNC.md)

---

## 📊 Tool Comparison

| Feature | check.py | data_puller.py | incremental_sync.py ⭐ |
|---------|----------|----------------|------------------------|
| **Connection test** | ✅ | ✅ | ✅ |
| **Pull all data** | ❌ (5 docs) | ✅ | ✅ (first run) |
| **Pull recent only** | ❌ | ✅ | ✅ |
| **Auto tracking** | ❌ | ❌ | ✅ |
| **Export to JSON** | ❌ | ✅ | ✅ |
| **Real-time listener** | ❌ | ✅ | ❌ |
| **Automation-ready** | ❌ | Partial | ✅ |
| **Use case** | Testing | One-off export | Production sync |

---

## 📖 Common Tasks

### Task: Test a New Firebase Project
```bash
# Update .env
SERVICE_ACCOUNT_FILE=new-project-firebase-adminsdk.json

# Test connection
python firestore_check.py
```

### Task: Full Backup of Collection
```bash
# One-time pull
python firestore_data_puller.py all

# Or for production use
python firestore_incremental_sync.py  # First run pulls all (10k limit)
```

### Task: Set Up Hourly Sync
```bash
# Add to crontab
crontab -e

# Add this line
0 * * * * cd /path/to/project && /path/to/.venv/bin/python firestore_incremental_sync.py >> sync.log 2>&1
```

### Task: Monitor Live Changes
```bash
python firestore_data_puller.py listen
# Press Ctrl+C to stop
```

### Task: Pull Last 7 Days Only
```bash
python firestore_data_puller.py recent
# Enter: 168 (24 hours × 7 days)
```

### Task: Reset Incremental Sync
```bash
rm .last_sync_timestamp
python firestore_incremental_sync.py
# Next run starts fresh
```

---

## 🔧 Setup Details

### Requirements
```
firebase-admin>=6.0.0,<7.0.0
boto3
python-dotenv
```

### Environment Variables

| Variable | Required | Description | Example |
|----------|----------|-------------|---------|
| `FIRESTORE_COLLECTION` | Yes | Collection name | `app_usage_logs` |
| `SERVICE_ACCOUNT_FILE` | Yes | Path to service account JSON | `serviceAccount.json` |
| `AWS_ACCESS_KEY_ID` | Optional | For Kinesis integration | `AKIAXXX...` |
| `AWS_SECRET_ACCESS_KEY` | Optional | For Kinesis integration | `secret...` |
| `LAST_SYNC_FILE` | Optional | Custom sync timestamp file | `.last_sync_timestamp` |
| `SYNC_OUTPUT_DIR` | Optional | Custom output directory | `sync_output` |

### Service Account JSON
Place your Firebase service account JSON files in the project root:
- `uniti-production-firebase-adminsdk.json`
- `easlow-e5eef.json`
- Or any custom name (update `.env`)

---

## 🐛 Troubleshooting

### Issue: "_UnaryStreamMultiCallable object has no attribute '_retry'"

**Root Cause:** Collection too large, query timeout

**Solution:**
```bash
# Use pagination (automatically handled in scripts)
python firestore_incremental_sync.py  # ✅ Already paginated
python firestore_data_puller.py all   # ✅ Already paginated
```

### Issue: "The query requires an index"

**Solution:**
1. Error message includes Firebase Console URL
2. Click URL to create index
3. Wait 1-2 minutes
4. Re-run script

### Issue: "No new documents" but expecting data

**Checklist:**
- ✅ Documents have `timestamp` field?
- ✅ Timestamp is in milliseconds (not seconds)?
- ✅ Check `.last_sync_timestamp` value
- ✅ Try resetting: `rm .last_sync_timestamp`

### Issue: Want to pull ALL data without limits

**Solution:** Edit the script
```python
# In firestore_incremental_sync.py, line 112
max_docs = None  # Change from 10000 to None

# In firestore_data_puller.py, line 244
docs = pull_all_data_paginated(page_size=1000, max_docs=None)
```

### Issue: "firebase-admin version conflict"

**Solution:**
```bash
pip install "firebase-admin>=6.0.0,<7.0.0" --force-reinstall
```

---

## 📁 Project Structure

```
uniti-firebase-listener/
├── .env                              # Configuration
├── .last_sync_timestamp              # Incremental sync state
├── requirements.txt                  # Python dependencies
│
├── firestore_check.py                # Connection tester
├── firestore_data_puller.py          # Manual export tool
├── firestore_incremental_sync.py     # Auto sync tool ⭐
│
├── README.md                         # Main project README
├── README_TOOLS.md                   # This file
├── README_DATA_PULLER.md             # data_puller.py docs
├── README_INCREMENTAL_SYNC.md        # incremental_sync.py docs
│
├── sync_output/                      # Exported data
│   ├── incremental_sync_*.json       # Sync exports
│   └── firestore_export_*.json       # Manual exports
│
└── *.json                            # Firebase service accounts
    ├── uniti-production-firebase-adminsdk.json
    └── easlow-e5eef.json
```

---

## 🎯 Recommended Workflow

### For Testing/Development
```bash
# 1. Test connection
python firestore_check.py

# 2. Try pulling recent data
python firestore_data_puller.py recent

# 3. Set up incremental sync
python firestore_incremental_sync.py
```

### For Production
```bash
# 1. Initial setup
python firestore_incremental_sync.py

# 2. Automate with cron
crontab -e
# Add: 0 * * * * cd /path && /path/.venv/bin/python firestore_incremental_sync.py

# 3. Monitor
tail -f sync.log
```

---

## 🔑 Key Features

✅ **Multiple strategies** - Choose the right tool for your task
✅ **Automatic pagination** - Handles large collections (millions of docs)
✅ **Incremental sync** - Only download what's new
✅ **Production-ready** - Error handling, logging, automation support
✅ **Flexible** - Works with any Firestore collection
✅ **Well-documented** - Clear README files for each tool

---

## 📝 Notes

- Both `easlow-e5eef.json` and `uniti-production-firebase-adminsdk.json` credentials work correctly
- The original connection issue was due to collection size, not credentials
- Use `firestore_incremental_sync.py` for regular/automated syncing
- Use `firestore_data_puller.py` for one-off manual tasks
- Use `firestore_check.py` for quick connection verification

---

## 📚 Additional Resources

- [Firebase Admin SDK Documentation](https://firebase.google.com/docs/admin/setup)
- [Firestore Query Documentation](https://firebase.google.com/docs/firestore/query-data/queries)
- [Python dotenv Documentation](https://pypi.org/project/python-dotenv/)

---

**Need help?** Check the individual README files:
- [README_DATA_PULLER.md](README_DATA_PULLER.md) - Manual export strategies
- [README_INCREMENTAL_SYNC.md](README_INCREMENTAL_SYNC.md) - Automated syncing

**Last updated:** 2025-11-21

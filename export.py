import json
import logging
import os
from datetime import datetime, timedelta, timezone
from typing import Any, Dict, List

from dotenv import load_dotenv
import firebase_admin
from firebase_admin import credentials, firestore


def _load_config() -> Dict[str, Any]:
    load_dotenv()

    config = {
        "service_account_file": (os.getenv("SERVICE_ACCOUNT_FILE") or "").strip(),
        "firestore_collection": (os.getenv("FIRESTORE_COLLECTION") or "").strip(),
        "output_file": (os.getenv("EXPORT_FILE", "firestore_export.json") or "").strip(),
        "query_scope": (os.getenv("FIRESTORE_QUERY_SCOPE", "group") or "group").strip().lower(),
        "parent_collection": (os.getenv("FIRESTORE_PARENT_COLLECTION") or "").strip(),
        "debug_list": os.getenv("DEBUG_FIRESTORE_LIST", "").lower() in ("1", "true", "yes"),
    }

    missing = [k for k in ("service_account_file", "firestore_collection") if not config[k]]
    if missing:
        raise RuntimeError(f"Missing required environment variables: {', '.join(missing)}")

    if config["query_scope"] not in ("group", "collection"):
        raise RuntimeError("FIRESTORE_QUERY_SCOPE must be 'group' or 'collection'")

    return config


def _to_json_ready(value: Any) -> Any:
    if isinstance(value, dict):
        return {k: _to_json_ready(v) for k, v in value.items()}
    if isinstance(value, list):
        return [_to_json_ready(v) for v in value]
    if hasattr(value, "isoformat"):
        return value.isoformat()
    return value


def _timestamp_to_iso(ts: Any) -> Any:
    """Convert Firestore/Protobuf timestamps to ISO strings."""
    if ts is None:
        return None
    if hasattr(ts, "isoformat"):
        return ts.isoformat()
    if hasattr(ts, "seconds") and hasattr(ts, "nanos"):
        return datetime.fromtimestamp(ts.seconds + ts.nanos / 1_000_000_000, tz=timezone.utc).isoformat()
    return str(ts)


def _log_debug_listing(db: firestore.client, config: Dict[str, Any]) -> None:
    if not config["debug_list"]:
        return

    try:
        logging.info("Debug: listing top-level collections (max 5 docs each)")
        for coll in db.collections():
            sample = []
            for doc in coll.limit(5).stream():
                sample.append(doc.reference.path)
            logging.info("Top-level collection '%s' sample paths: %s", coll.id, sample or "no docs")
    except Exception:
        logging.exception("Debug: failed to list top-level collections")

    try:
        if config["query_scope"] == "group":
            query = db.collection_group(config["firestore_collection"]).limit(5)
            scope_desc = "collection group"
        else:
            query = db.collection(config["firestore_collection"]).limit(5)
            scope_desc = "collection"

        sample_paths = [doc.reference.path for doc in query.stream()]
        logging.info(
            "Debug: sample from %s '%s': %s",
            scope_desc,
            config["firestore_collection"],
            sample_paths or "no docs",
        )
    except Exception:
        logging.exception("Debug: failed to sample target query")


def export_collection_group(config: Dict[str, Any]) -> List[Dict[str, Any]]:
    cred = credentials.Certificate(config["service_account_file"])
    firebase_admin.initialize_app(cred)
    db = firestore.client()

    _log_debug_listing(db, config)

    if config["query_scope"] == "group":
        query = db.collection_group(config["firestore_collection"])
    else:
        query = db.collection(config["firestore_collection"])

    docs = query.stream()

    results = []
    total = 0
    skipped_parent = 0
    for doc in docs:
        total += 1
        if config.get("parent_collection"):
            marker = f"/{config['parent_collection']}/"
            if marker not in doc.reference.path:
                skipped_parent += 1
                continue

        results.append(
            {
                "document_id": doc.id,
                "document_path": doc.reference.path,
                "data": _to_json_ready(doc.to_dict()),
                "create_time": _timestamp_to_iso(doc.create_time),
                "update_time": _timestamp_to_iso(doc.update_time),
            }
        )

    logging.info(
        "Processed %d docs (skipped by parent filter: %d, exported: %d)",
        total,
        skipped_parent,
        len(results),
    )

    return results


def main() -> None:
    logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")
    config = _load_config()
    logging.info(
        "Exporting %s '%s' (parent filter: %s)",
        "collection group" if config["query_scope"] == "group" else "collection",
        config["firestore_collection"],
        config["parent_collection"] or "none",
    )

    data = export_collection_group(config)
    output_path = config["output_file"]

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    logging.info("Exported %d documents to %s", len(data), output_path)


if __name__ == "__main__":
    main()

#!/usr/bin/env bash
set -euo pipefail

# Decode the Firebase service account from FIREBASE_SA_B64, if provided.
if [[ -n "${FIREBASE_SA_B64:-}" ]]; then
  if [[ -z "${SERVICE_ACCOUNT_FILE:-}" ]]; then
    echo "SERVICE_ACCOUNT_FILE must be set when FIREBASE_SA_B64 is provided" >&2
    exit 1
  fi
  echo "$FIREBASE_SA_B64" | base64 -d > "$SERVICE_ACCOUNT_FILE"
  chmod 600 "$SERVICE_ACCOUNT_FILE"
fi

exec "$@"

# Run With PM2 (daemonized)

Steps to keep `listener.py` running under PM2.

1) From repo root, create/install the virtualenv (once):
   - `python -m venv .venv && source .venv/bin/activate`
   - `pip install --upgrade pip`
   - `pip install -r requirements.txt`
2) Copy `.env.example` to `.env`, fill AWS values, and place `serviceAccount.json` in the root.
3) Install PM2 globally (requires Node.js):
   - `npm install -g pm2`
4) Start the listener under PM2 (from repo root):
   - `pm2 start listener.py --interpreter $(pwd)/.venv/bin/python --name firestore-listener`
5) Check it:
   - `pm2 status`
   - `pm2 logs firestore-listener` (stream logs)
6) Restart/stop/remove:
   - `pm2 restart firestore-listener`
   - `pm2 stop firestore-listener`
   - `pm2 delete firestore-listener`
7) Auto-start on reboot (run both commands):
   - `pm2 startup`
   - `pm2 save`

Notes
- PM2 runs from the repo root so it can read `.env` and `serviceAccount.json`.
- To update code or dependencies: stop (`pm2 stop firestore-listener`), pull/install, then start again.


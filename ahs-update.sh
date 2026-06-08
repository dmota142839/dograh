#!/usr/bin/env bash
# AHS: pull upstream Dograh updates, keep white-label edits, rebuild, push fork.
set -e
cd "$(dirname "$0")"
echo "[ahs-update] fetching upstream..."; git fetch upstream
echo "[ahs-update] merging upstream/main (resolve conflicts if any, then re-run from build step)..."
git merge upstream/main || { echo "CONFLICTS — resolve, 'git add -A && git commit', then: docker compose build ui && docker compose up -d && git push origin main"; exit 1; }
echo "[ahs-update] rebuilding white-labeled UI..."; docker compose build ui
echo "[ahs-update] redeploying..."; docker compose up -d
echo "[ahs-update] pushing merged state to fork..."; git push origin main
echo "[ahs-update] done."

#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then
  echo "Usage: ./scripts/setup_remote_ssh.sh GITHUB_REPO (e.g. GHR-STEAM/GHR-STEAM)"
  exit 1
fi
REPO="$1"
git remote set-url origin git@github.com:${REPO}.git
echo "Remote set to SSH: git@github.com:${REPO}.git"

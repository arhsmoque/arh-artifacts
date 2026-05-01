#!/usr/bin/env bash
# Usage: git-pull.sh [branch]
set -euo pipefail

BRANCH="${1:-$(git branch --show-current)}"

if [[ -z "$BRANCH" ]]; then
  echo "Error: could not determine current branch" >&2
  exit 1
fi

# Fetch with exponential backoff retry (2s, 4s, 8s, 16s)
DELAYS=(2 4 8 16)
for i in 0 1 2 3; do
  if git fetch origin "$BRANCH"; then
    break
  fi
  WAIT="${DELAYS[$i]}"
  echo "Fetch failed, retrying in ${WAIT}s..." >&2
  sleep "$WAIT"
  if [[ $i -eq 3 ]]; then
    echo "Error: fetch failed after 4 attempts" >&2
    exit 1
  fi
done

git pull origin "$BRANCH"
echo "Pulled origin/$BRANCH"

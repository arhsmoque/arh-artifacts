#!/usr/bin/env bash
# Usage: git-push.sh "commit message" [branch]
set -euo pipefail

COMMIT_MSG="${1:?Usage: $0 \"commit message\" [branch]}"
BRANCH="${2:-$(git branch --show-current)}"

if [[ -z "$BRANCH" ]]; then
  echo "Error: could not determine current branch" >&2
  exit 1
fi

# Stage all changes
git add -A

if git diff --cached --quiet; then
  echo "Nothing to commit."
else
  git commit -m "$COMMIT_MSG"
fi

# Push with exponential backoff retry (2s, 4s, 8s, 16s)
DELAYS=(2 4 8 16)
for i in 0 1 2 3; do
  if git push -u origin "$BRANCH"; then
    echo "Pushed to origin/$BRANCH"
    exit 0
  fi
  WAIT="${DELAYS[$i]}"
  echo "Push failed, retrying in ${WAIT}s..." >&2
  sleep "$WAIT"
done

echo "Error: push failed after 4 attempts" >&2
exit 1

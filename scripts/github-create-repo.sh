#!/usr/bin/env bash
# Usage: github-create-repo.sh <repo-name> [description] [public|private]
#
# Requires GITHUB_TOKEN env var (personal access token with repo scope)
# and GITHUB_OWNER env var (your GitHub username or org name).
set -euo pipefail

REPO_NAME="${1:?Usage: $0 <repo-name> [description] [public|private]}"
DESCRIPTION="${2:-}"
VISIBILITY="${3:-private}"

: "${GITHUB_TOKEN:?GITHUB_TOKEN env var is required}"
: "${GITHUB_OWNER:?GITHUB_OWNER env var is required}"

if [[ "$VISIBILITY" == "public" ]]; then
  PRIVATE="false"
else
  PRIVATE="true"
fi

PAYLOAD=$(printf '{"name":"%s","description":"%s","private":%s,"auto_init":false}' \
  "$REPO_NAME" "$DESCRIPTION" "$PRIVATE")

RESPONSE=$(curl -sf \
  -X POST \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/user/repos \
  -d "$PAYLOAD")

CLONE_URL=$(printf '%s' "$RESPONSE" | grep -o '"clone_url":"[^"]*"' | cut -d'"' -f4)
HTML_URL=$(printf '%s' "$RESPONSE" | grep -o '"html_url":"[^"]*"' | head -1 | cut -d'"' -f4)

echo "Repository created: $HTML_URL"
echo "Clone URL: $CLONE_URL"

# Optionally set as remote if we're inside a git repo
if git rev-parse --is-inside-work-tree &>/dev/null; then
  read -rp "Set '$CLONE_URL' as 'origin' remote? [y/N] " CONFIRM
  if [[ "${CONFIRM,,}" == "y" ]]; then
    if git remote get-url origin &>/dev/null; then
      git remote set-url origin "$CLONE_URL"
      echo "Updated origin remote."
    else
      git remote add origin "$CLONE_URL"
      echo "Added origin remote."
    fi
  fi
fi

#!/usr/bin/env bash
#
# push-git.sh
# Safely sync local repo with origin, preferring the remote README (in case you edited it on GitHub),
# while pushing all local changes. Ensures env/certs/*bak files are ignored.
#
# Usage:
#   bash sync-and-push.sh [repo_dir=. ] [branch=main]
#
set -euo pipefail

REPO_DIR="${1:-.}"
BRANCH="${2:-main}"

cd "$REPO_DIR"

# --- sanity checks ---
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "❌ Not a git repository: $REPO_DIR" >&2
  exit 1
fi

# --- make sure sensitive files are ignored ---
touch .gitignore
declare -a IGNORES=(
  ".env"
  "*.env"
  "*.env.*"
  "*.pem"
  "*.crt"
  "*.cer"
  "*.key"
  "certs/"
  "secrets/"
  "private/"
  "*.bak"
  "*~"
  ".DS_Store"
)
for pat in "${IGNORES[@]}"; do
  grep -qxF "$pat" .gitignore || echo "$pat" >> .gitignore
done
git add .gitignore
git commit -m "chore: ensure .gitignore excludes env/certs/*bak" || true

# --- fetch latest & ensure branch ---
git fetch --all --prune
git checkout "$BRANCH"

# --- stash any work in progress (including untracked) ---
STASH_NAME="auto-stash-$(date -u +%Y%m%dT%H%M%SZ)"
git stash push -u -m "$STASH_NAME" || true

# --- if README changed on GitHub, prefer remote version to avoid conflicts ---
if git ls-remote --exit-code --heads origin "$BRANCH" >/dev/null 2>&1; then
  if git show "origin/$BRANCH:README.md" >/dev/null 2>&1; then
    # Only overwrite if different
    TMP_README="$(mktemp)"
    git show "origin/$BRANCH:README.md" > "$TMP_README" || true
    if [ -s "$TMP_README" ]; then
      if [ ! -f README.md ] || ! diff -q README.md "$TMP_README" >/dev/null 2>&1; then
        mv "$TMP_README" README.md
        git add README.md
        git commit -m "chore: sync README from origin/$BRANCH" || true
      else
        rm -f "$TMP_README"
      fi
    else
      rm -f "$TMP_README"
    fi
  fi
fi

# --- re-apply stashed changes ---
if git stash list | grep -q "$STASH_NAME"; then
  # Try to restore index too
  git stash pop --index || true

  # If README conflicts appear, take remote/theirs for README
  if git ls-files -u | awk '{print $4}' | grep -qx "README.md"; then
    git checkout --theirs README.md || true
    git add README.md
  fi
fi

# --- stage everything except ignored files ---
git add -A

# --- commit local changes if any ---
if ! git diff --cached --quiet; then
  git commit -m "feat: local updates $(date -u +'%Y-%m-%d %H:%M:%S UTC')"
fi

# --- rebase onto origin to keep history clean ---
# If README conflicts during rebase, automatically accept the remote README.
set +e
git pull --rebase origin "$BRANCH"
REB_RES=$?
if [ $REB_RES -ne 0 ]; then
  if git ls-files -u | awk '{print $4}' | grep -qx "README.md"; then
    git checkout --theirs README.md
    git add README.md
    git rebase --continue || {
      echo "❌ Rebase failed after resolving README. Please resolve remaining conflicts manually." >&2
      exit 1
    }
  else
    echo "❌ Rebase failed. Please resolve conflicts and run 'git rebase --continue'." >&2
    exit 1
  fi
fi
set -e

# --- push ---
git push origin "$BRANCH"

echo "✅ Synced and pushed to origin/$BRANCH from $(pwd)"


#!/bin/bash

MSG="$1"
BRANCH="$2"

[ -z "$MSG" ] && { echo "Commit message required"; exit 1; }

if [ -z "$BRANCH" ]; then
  BRANCH=$(git branch --show-current)
fi

if [ -z "$BRANCH" ]; then
  git show-ref --verify --quiet refs/heads/main && BRANCH="main" || BRANCH="master"
fi

git add .
git commit -m "$MSG" && git push origin "$BRANCH"


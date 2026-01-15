#!/bin/bash

BRANCH="$1"

if [ -z "$BRANCH" ]; then
  if git show-ref --verify --quiet refs/heads/main; then
    BRANCH="main"
  else
    BRANCH="master"
  fi
fi

git pull origin "$BRANCH"


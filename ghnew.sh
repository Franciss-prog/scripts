#!/usr/bin/env bash
set -e

# check if the repo have .git
[ -d .git ] && {
  echo "Git already initialized"
  exit 1
}

# ask the user for repo visibility
read -rp "Do you want to make the repo public? [Y/n]: " REPO_VISIBILITY

# set the visibility default to private
VISIBILITY="--private"

# validation for use input
[[ "$REPO_VISIBILITY" =~ ^[Yy]$ ]] && VISIBILITY="--public"

# init to master branch
git init -b master

# put some readme.md context and add .gitignore if doesn't  have
[ ! -f README.md ] && echo "# $(basename "$PWD")" >README.md
[ ! -f .gitignore ] && touch .gitignore

# commit inside directory
git add .
git commit -m "Initial commit"

# finally add repo using gh
gh repo create "$(basename "$PWD")" --source=. $VISIBILITY --push

echo "Repo ready"

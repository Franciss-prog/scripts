#!/usr/bin/env bash
set -e


# check if the repo have .git
[ -d .git ] && { echo "Git already initialized"; exit 1; }

# init to master branch
git init -b master

# put some readme.md context and add .gitignore if doesn't  have
[ ! -f README.md ] && echo "# $(basename "$PWD")" > README.md
[ ! -f .gitignore ] && touch .gitignore

# commit inside directory
git add .
git commit -m "Initial commit"

# finally add repo using gh
gh repo create "$(basename "$PWD")" --source=. --public --push

echo "Repo ready"


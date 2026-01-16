# 1. clone the repo
gh repo clone Franciss-prog/projInit || exit

TEMPLATE_NAME="projInit"

# 2. ask for name of project
read -rp "project name: " PROJECT_NAME

# 3. rename the template to PROJECT_NAME
mv $TEMPLATE_NAME $PROJECT_NAME

# then go to renamed directory
cd $PROJECT_NAME || exit

# 4. ask the user for .env.local
read -s -rp "Supabase URL: " SUPABASE_URL
echo

read -s -rp "Supabase Anon Key: " SUPABASE_ANON_KEY
echo

# 5 ask the user for readme.md Content:
read -rp "Do you want to Add REAME.md content? [Y/n]: " README_CONTENT
echo

# validate the readme user input content
if [[ -z "$README_CONTENT" || "$README_CONTENT" =~ ^[Yy]$ ]]; then

  # ask the user what content should we input
  read -rp "Put your README_CONTENT here: "
  content=($cat)

  # then find README.md and remove all the content in README.md and replace the inputted one

fi
# 6. Create .env.local
cat <<EOF >.env.local
PUBLIC_SUPABASE_URL=$SUPABASE_URL
PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY=$SUPABASE_ANON_KEY
EOF

# 7. ask the user if want to push the repo with renamed
read -p "Do you want to upload it to github? [Y/n]: " UPLOAD_GITHUB

# if the user want to push the repo
if [[ -z "$UPLOAD_GITHUB" || "$UPLOAD_GITHUB" =~ ^[Yy]$ ]]; then
  # remove first the .git folder
  rm -rf .git
  # push it to repo
  sh ~/.config/scripts/ghnew.sh $PROJECT_NAME
fi
# 8. Alert the user ;)
echo "Setup complete!,  you can run bun install && bun run dev."

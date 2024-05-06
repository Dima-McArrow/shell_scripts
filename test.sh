#!/usr/bin/zsh

# Use gum to choose the branch
selected_branch=$(git branch | gum choose | sed 's/^\* //;s/^[ \t]*//;s/[ \t]*$//')

# Get the current branch name
current_branch=$(git branch --show-current)

# Check if the selected branch is the same as the current branch
if [[ "$selected_branch" == "$current_branch" ]]; then
  echo "You are already on '$current_branch'. No need to switch branches."
else
  # Checkout to the selected branch if different
  git checkout "$selected_branch"
fi

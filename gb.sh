#!/usr/bin/zsh

echo "\n"

# Use gum to choose the branch
selected_branch=$(git branch | gum choose --header="Git branch" --header.foreground="129" --limit=1 | sed 's/^\* //;s/^[ \t]*//;s/[ \t]*$//')

# Get the current branch name
current_branch=$(git branch --show-current)

# Check if the selected branch is the same as the current branch
if [[ "$selected_branch" == "$current_branch" ]]; then
  echo "Already on '$current_branch' branch. No need to switch branches."
else
  # Checkout to the selected branch if different
  git checkout "$selected_branch"
fi

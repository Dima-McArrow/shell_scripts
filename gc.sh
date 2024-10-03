#!/usr/bin/zsh

echo "\n"

# Display a styled message
gum style \
	--foreground 202 --border-foreground 208 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'  Git add all and git commit.' 'Type, summary, message.'

# Choose a commit type
TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert" --header="Choose the type of commit")

# Input the summary for the commit
SUMMARY=$(gum input --value "$TYPE: " --header="Summary")

# Input the detailed message for the commit
MESSAGE=$(gum write --header="Message")

# Confirm and perform the commit
gum confirm "Commit changes?" && git add . && git commit -m "$SUMMARY" -m "$MESSAGE"

# Display a success message
gum style \
	--foreground 202 --background 46 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Success! Changes committed.'

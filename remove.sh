#!/usr/bin/zsh

# Request the file or folder to remove using gum input
WHAT=$(gum input \
          --placeholder "Enter the file or folder to remove:" \
          --prompt.foreground "#0FF" \
          --prompt "* " \
          --width 80)

# Check if the input is empty and exit if true
if [[ -z "$WHAT" ]]; then
  echo "No input provided. Exiting..." | gum style --foreground="124"
  exit 1
fi

# Use gum confirm to get confirmation before deleting
if gum confirm "Are you sure you want to delete '$WHAT'?" \
  --affirmative "Yes, delete it" \
  --negative "No, keep it" \
  --prompt.foreground "yellow"; then
  # Perform the deletion
  rm -rf "$WHAT"
  # Check if the removal command succeeded
  if [[ $? -eq 0 ]]; then
    echo "Successfully removed '$WHAT'." | gum style --border rounded --padding 1 --margin 1 --foreground="70"
    # Optionally, send a desktop notification
    notify-send "File removed" "The file or folder has been successfully removed." --icon=dialog-information
  else
    echo "Error removing '$WHAT'." | gum style --border rounded --padding 1 --margin 1 --foreground="124"
  fi
else
  echo "Operation cancelled." | gum style --foreground="214"
fi

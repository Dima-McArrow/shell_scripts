#!/bin/zsh

# Run apt update and capture output
sudo apt update | while IFS= read -r line; do
  # Log each line using gum
  gum log --prefix="APT UPDATE" --level="info" --message.foreground="cyan" "$line"
done

# Check the exit status of apt update
if [ $? -eq 0 ]; then
  echo "   "
  gum log --prefix="SUCCESS" --message.foreground="green" "apt update completed successfully."
else
  gum log --prefix="ERROR" --level="error" --message.foreground="red" "apt update failed."
fi

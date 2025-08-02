#!/bin/bash

# Prompt user for session name using gum
session_name=$(gum input --placeholder "Enter new tmux session name")

# If no input was given, show a message and exit
if [ -z "$session_name" ]; then
  gum style --foreground="#8b1f9d" --background="#f4d9f9" --padding "1 2" --border rounded \
    "No session name entered. Exiting."
  exit 1
fi

# Try to create and switch to the new tmux session
if tmux new-session -d -s "$session_name"; then
  tmux switch-client -t "$session_name"
else
  gum style --foreground="#ffffff" --background="#dc2626" --padding "1 2" --border rounded \
    "Failed to create session: $session_name"
  exit 1
fi

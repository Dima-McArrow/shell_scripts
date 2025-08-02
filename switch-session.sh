#!/bin/bash

# Get current session
current_session=$(tmux display-message -p '#S')

# List all sessions, excluding the current one
sessions=$(tmux list-sessions | sed -E 's/:.*$//' | grep -v "^${current_session}$")

# Check if there are any other sessions
if [ -z "$sessions" ]; then
  gum style --foreground="#e0c8f5" --padding "1 2" --border rounded --border-foreground="#e0c8f5" "Only one session ($current_session) is active."
  gum style --foreground="#c8f5e0" --padding "0 2" "Press Enter to close this window"
  read -r
  exit 0
fi

gum style --foreground="#e0c8f5" --padding "1 0" "Session ($current_session) is active."
# Use gum to choose a session
chosen=$(echo "$sessions" | gum choose --limit 1 --header "Switch to session:")

# If a session was selected, switch to it
if [ -n "$chosen" ]; then
  tmux switch-client -t "$chosen"
fi

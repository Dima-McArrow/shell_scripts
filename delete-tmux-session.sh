#!/bin/bash

# Get current session
current_session=$(tmux display-message -p '#S')

# List all sessions, excluding the current one
sessions=$(tmux list-sessions | sed -E 's/:.*$//' | grep -v "^${current_session}$")

# If only one session (the current one)
if [ -z "$sessions" ]; then
  gum style --foreground="#e0c8f5" --padding "1 2" --border rounded --border-foreground="#e0c8f5" \
    "Only one session ($current_session) is active."
  gum style --foreground="#c8f5e0" --padding "0 2" "Press Enter to close this window"
  read -r
  exit 0
fi

# Show current session
gum style --foreground="#e0c8f5" --padding "1 0" "Session ($current_session) is active."

# Choose session to delete
chosen=$(echo "$sessions" | gum choose --limit 1 --header "Delete which session?")

# If user selected a session
if [ -n "$chosen" ]; then
  if gum confirm "Are you sure you want to delete session: $chosen?"; then
    tmux kill-session -t "$chosen"
    gum style --foreground="#dc2626" --padding "1 2" --border rounded --border-foreground="#dc2626" \
      "Session '$chosen' deleted."
  else
    gum style --foreground="#e0c8f5" --padding "1 2" --border rounded --border-foreground="#e0c8f5" \
      "Deletion cancelled. '$chosen' was not deleted."
  fi
fi

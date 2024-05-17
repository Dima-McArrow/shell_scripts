#!/usr/bin/zsh

# Print current shell
echo "Running in shell: $SHELL"

# Check if HISTFILE is set and exists
echo "HISTFILE: $HISTFILE"
[ -f "$HISTFILE" ] && echo "History file exists" || echo "History file not found"

# Show the output of gum command (not executing it)
gum_command_output=$(gum filter --limit=1 --placeholder="Last 20 commands" < $HISTFILE --height 20)
echo "Command to be executed: '$gum_command_output'"

# Now try to execute it
eval "$gum_command_output"

# eval "$(gum filter --limit=1 --placeholder="Last 20 commands" < $HISTFILE --height 20)"

#!/usr/bin/zsh

export WHAT=$(gum input --placeholder "File or folder to remove:")

gum confirm && rm -r $WHAT && echo "\u001B[32m \u001B[0m Done!" || echo "\u001b[33m \u001B[0m File not removed"

# notify-send "File removed" --icon=dialog-information
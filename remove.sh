#!/usr/bin/zsh

export FILE=$(gum input --placeholder "File to remove:")

gum confirm && rm $FILE && echo "  Done!" || echo "  File not removed"

# notify-send "File removed" --icon=dialog-information
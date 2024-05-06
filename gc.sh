#!/usr/bin/zsh

export MESSAGE=$(gum input --placeholder "Commit message:")

git add . && git commit -m "$MESSAGE"

echo "  Done!"
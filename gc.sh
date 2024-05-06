#!/usr/bin/zsh

export MESSAGE=$(gum input --placeholder "Commit message:")

git add . && git commit -m "$MESSAGE"

echo "\u001B[32m \u001B[0m Done!"
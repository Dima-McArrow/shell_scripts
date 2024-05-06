#!/usr/bin/zsh

export MESSAGE=$(gum input --header="Git add and commit" --header.foreground="129" --placeholder "Commit message")

git add . && git commit -m "$MESSAGE"

echo "\u001B[32m \u001B[0m Done!"
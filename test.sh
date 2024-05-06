#!/usr/bin/zsh

git branch | gum choose --prompt "Select a branch to checkout:" | xargs git checkout
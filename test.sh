#!/usr/bin/zsh

git branch | gum choose --header "Select a branch to checkout:" | xargs git checkout
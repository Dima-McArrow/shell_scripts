#!/usr/bin/zsh

echo "Executing git add . and git commit..."

echo "Enter commit message: "

read message

git add .

git commit -m $message

echo "Success!"


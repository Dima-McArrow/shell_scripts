#!/usr/bin/zsh

# Clear the previous output for a clean start
clear

echo "Select items to ignore in .gitignore:" | gum style --border rounded --padding 1 --margin 1 --foreground="25"

# Collect all selections into an array
selected_items=($(ls -a | gum choose --no-limit))

# Check if .gitignore already exists, if not create it
if [ ! -f ".gitignore" ]; then
    touch .gitignore
fi

# Iterate over each selected item
for item in "${selected_items[@]}"; do
    if [ -d "$item" ]; then  # Check if it's a directory
        echo "$item/" >> .gitignore  # Append '/' to directory names
    else
        echo "$item" >> .gitignore
    fi
done

echo "\n.gitignore file updated with selected items:" | gum style --padding 1 --margin 1 --foreground="196"

# Display the contents of .gitignore with syntax highlighting and custom styling
gum format -t code < .gitignore

# Initialize git repository if not already initialized
if [ ! -d ".git" ]; then
    git init
    echo "\u001B[32m \u001B[0m Done!" | gum style --border rounded --padding 1 --margin 1 --foreground white
else
    echo "Git repository already initialized." | gum style --border rounded --padding 1 --margin 1 --foreground="178"
fi



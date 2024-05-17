#!/usr/bin/zsh

clear

# Display initial style message
gum style \
    --foreground 33 --border-foreground 184 --border double \
    --align center --width 50 --margin "1 2" --padding "2 4" \
    '  Python Project Setup' 'Creation and Activation of a' 'Virtual Environment'

# Request the project name using gum input
export PROJECT_NAME=$(gum input \
    --header " " \
    --placeholder="Enter the project name:" \
    --prompt.foreground="118" \
    --header.foreground="81" \
    --placeholder.foreground="122" \
    --prompt=" " \
    --width=80)

# Check if the input is empty and exit if true
if [[ -z "$PROJECT_NAME" ]]; then
    echo "No input provided. Exiting..." | gum style --foreground="124"
    exit 1
fi

# Create the virtual environment
gum spin --spinner dot --title "Creating virtual environment '$PROJECT_NAME'" -- python3 -m venv $PROJECT_NAME
if [[ $? -ne 0 ]]; then
    echo "Failed to create the virtual environment. Exiting..." | gum style --foreground="124"
    exit 1
fi

# Activate the virtual environment
source $PROJECT_NAME/bin/activate
if [[ $? -ne 0 ]]; then
    echo "Failed to activate the virtual environment. Exiting..." | gum style --foreground="124"
    exit 1
fi

clear

# Display completion message
gum style \
    --foreground 212 --border-foreground 35 --border double \
    --align center --width 50 --margin "1 2" --padding "2 4" \
    'Project '$PROJECT_NAME' Setup Complete' 'Virtual Environment Activated'

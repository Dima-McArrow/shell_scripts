#!/usr/bin/zsh

# Function to check if required files are present
check_files() {
    if [[ ! -f "phpcs.phar" || ! -f "phpcbf.phar" ]]; then
        gum style --foreground 212 --bold "phpcs.phar and phpcbf.phar not found. Please install the scripts first."
        ask_to_install
    fi
}

# Function to ask the user if they want to install the scripts
ask_to_install() {
    install=$(gum choose --limit=1 Yes No --header="phpcs.phar and phpcbf.phar not found. Do you want to download and install them?")
    if [ "$install" = "Yes" ]; then
        download_files
    else
        exit 1
    fi
}

# Function to download the required files
download_files() {
    gum style --foreground 33 --bold "Downloading phpcs.phar and phpcbf.phar..."
    curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
    curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
    gum style --foreground 46 --bold "Download complete."
}

# Function to get the file to be checked
get_file() {
    gum file
}

# Function to choose whether to fix errors
should_fix_errors() {
    gum choose --limit=1 Yes No --header="Do you want to fix the errors?"
}

# Main script execution
check_files

WHAT=$(get_file)

# Remove surrounding quotes from the file path if they exist
WHAT=$(echo $WHAT | sed 's/^"//' | sed 's/"$//')

if [ -z "$WHAT" ]; then
    gum style --foreground 196 --bold "No file selected."
    exit 1
fi

# Run phpcs and capture the output
PHPCS_OUTPUT=$(php phpcs.phar --standard=PSR12 --colors "$WHAT")
PHPCS_EXIT_CODE=$?

if [ $PHPCS_EXIT_CODE -eq 0 ]; then
    gum style --foreground 46 --bold "No PHP errors found."
    exit 0
else
    echo "$PHPCS_OUTPUT" | gum style --bold --foreground="109"
fi

FIX=$(should_fix_errors)

if [ "$FIX" = "Yes" ]; then
    PHPCBF_OUTPUT=$(php phpcbf.phar --standard=PSR12 --colors "$WHAT")
    echo "$PHPCBF_OUTPUT" | gum style --bold --foreground="109"
    gum style --foreground 46 --bold "Errors fixed."
else
    gum style --foreground 214 --bold "No changes made."
fi

#!/usr/bin/zsh

# Display header with styling
echo "git diff with delta" | gum style --border rounded --padding 1 --margin 1 --foreground="25"

echo "Press any key to continue..." | gum style --padding 1 --margin 1 --foreground="25"
read -k1 -s

# Prompt the user to select the commits to compare
echo "Select the first commit:" | gum style --padding 1 --margin 1 --foreground="25"
TO_COMPARE=$(git log --oneline | gum filter --placeholder="Select a commit:" --limit=1 | cut -d' ' -f1)
if [[ -z "$TO_COMPARE" ]]; then
    echo "No commit selected for comparison. Exiting." | gum style --foreground="124"
    exit 1
fi



echo "Select the second commit:" | gum style --padding 1 --margin 1 --foreground="25"
COMPARE_WITH=$(git log --oneline | gum filter --placeholder="Select a commit:" --limit=1 | cut -d' ' -f1)
if [[ -z "$COMPARE_WITH" ]]; then
    echo "No commit selected for comparison. Exiting." | gum style --foreground="124"
    exit 1
fi



# Check if the selected commits are valid
if ! git cat-file -e $TO_COMPARE^{commit} 2>/dev/null || ! git cat-file -e $COMPARE_WITH^{commit} 2>/dev/null; then
    echo "One or both of the selected commits are invalid. Exiting." | gum style --foreground="124"
    exit 1
fi

clear

# Show the diff between the selected commits
echo "Showing diff between $TO_COMPARE and $COMPARE_WITH:" | gum style --padding 1 --margin 1 --foreground="25"
git diff $TO_COMPARE $COMPARE_WITH

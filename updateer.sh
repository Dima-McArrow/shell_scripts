#!/usr/bin/zsh

gum style \
	--foreground 212 --border-foreground 35 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'󱑠  Full system update and upgrade' 'for user '$USER

echo "\n\t\u001B[35m󰔰\u001B[0m  Updating \u001B[32mapt\u001B[0m ..."
sudo apt update && sudo apt upgrade -y

echo "\n\t\u001B[35m󰔰\u001B[0m  Updating \u001B[32mbrew\u001B[0m ..."
brew update && brew upgrade
echo "\n\t\u001B[33m---\u001B[0m \u001B[32mSuccess!\u001B[0m \u001B[33m---\u001B[0m"
# Update npm
echo "\n\t\u001B[35m󰔰\u001B[0m  Updating \u001B[32mnpm\u001B[0m ..."
npm update -g
echo "\n\t\u001B[33m---\u001B[0m \u001B[32mSuccess!\u001B[0m \u001B[33m---\u001B[0m"
# Update pip
echo "\n\t\u001B[35m󰔰\u001B[0m  Updating \u001B[32mpip3\u001B[0m ..."
pip install --upgrade $(pip list --outdated | cut -d" " -f1 -s | tail -n +3)
echo "\n\t\u001B[33m---\u001B[0m \u001B[32mSuccess!\u001B[0m \u001B[33m---\u001B[0m"

gum style \
	--foreground 212 --border-foreground 35 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'󱑠  System update complete.'



#  # Update zplug
#  echo "\n\t\u001B[35m󰔰\u001B[0m  Updating \u001B[32mzplug\u001B[0m to be done manually, run: \u001B[32mzplug\u001B[0m update"

#!/usr/bin/zsh

gum style \
	--foreground 212 --border-foreground 35 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'󱑠  Full system update and upgrade' 'for user '$USER

sleep 1

gum style \
	--foreground 255 --background 93 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'󱑠  Updating system packages ...'

gum style \
	--foreground 17 --background 47 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating apt (update) ...'

sudo apt update

gum style \
	--foreground 17 --background 43 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating apt (upgrade -y) ...'

sudo apt upgrade -y

gum style \
	--foreground 235 --background 214 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating apt (autoremove) ...'

sudo apt autoremove -y

gum style \
	--foreground 92 --background 42 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  success ...'

sleep 1

gum style \
	--foreground 22 --background 47 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating apt-get (update) ...'

sudo apt-get update

gum style \
	--foreground 13 --background 43 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating apt-get (upgrade -y) ...'

sudo apt-get upgrade -y

gum style \
	--foreground 235 --background 214 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating apt-get (autoremove) ...'

sudo apt-get autoremove -y

gum style \
	--foreground 92 --background 42 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  success ...'

sleep 1

# Update Homebrew

gum style \
	--foreground 195 --background 21 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating Homebrew ...'

brew update && brew upgrade

gum style \
	--foreground 92 --background 42 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  success ...'

sleep 1

# Update npm

gum style \
	--foreground 93 --background 44 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating npm ...'

npm update -g

ggum style \
	--foreground 92 --background 42 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  success ...'

sleep 1

gum style \
	--foreground 93 --background 44 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Running npm doctor ...'

npm doctor

gum style \
	--foreground 212 --border-foreground 35 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'󱑠  System update complete.'



#  # Update zplug
#  echo "\n\t\u001B[35m󰔰\u001B[0m  Updating \u001B[32mzplug\u001B[0m to be done manually, run: \u001B[32mzplug\u001B[0m update"

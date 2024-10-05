#!/usr/bin/zsh

figlet "Updateer" | gum style --foreground 212
echo "   "
gum style \
	--foreground 212 \
	'󱑠  Full system update and upgrade'

echo "   "
echo "   "

gum style \
	--foreground 154 \
	'User: '$USER

sleep 1

gum style \
	--foreground 255 --background 93 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'󱑠  Updating system packages ...'

gum style \
	--foreground 17 --background 47 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating apt (update) ...'

# Run apt update and capture output
sudo apt update | while IFS= read -r line; do
  # Log each line using gum
  gum log --prefix="APT UPDATE" --level="info" --message.foreground="cyan" "$line"
done

# Check the exit status of apt update
if [ $? -eq 0 ]; then
  echo "   "
  gum log --prefix="SUCCESS" --message.foreground="green" "apt update completed successfully."
else
	echo "   "
  gum log --prefix="ERROR" --level="error" --message.foreground="red" "apt update failed."
fi

gum style \
	--foreground 17 --background 43 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating apt (upgrade -y) ...'

# Run apt upgrade -y and capture output
sudo apt upgrade -y | while IFS= read -r line; do
  # Log each line using gum
  gum log --prefix="APT UPGRADE" --level="info" --message.foreground="cyan" "$line"
done

# Check the exit status of apt upgrade
if [ $? -eq 0 ]; then
	echo "   "
  gum log --prefix="SUCCESS" --message.foreground="green" "apt upgrade completed successfully."
else
	echo "   "
  gum log --prefix="ERROR" --level="error" --message.foreground="red" "apt upgrade failed."
fi

gum style \
	--foreground 235 --background 214 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating apt (autoremove) ...'

# Run apt autoremove -y and capture output
sudo apt autoremove -y | while IFS= read -r line; do
  # Log each line using gum
  gum log --prefix="APT AUTOREMOVE" --level="info" --message.foreground="cyan" "$line"
done

# Check the exit status of apt autoremove
if [ $? -eq 0 ]; then
	echo "   "
  gum log --prefix="SUCCESS" --message.foreground="green" "apt autoremove completed successfully."
else
	echo "   "
  gum log --prefix="ERROR" --level="error" --message.foreground="red" "apt autoremove failed."
fi

gum style \
	--foreground 92 --background 42 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  apt update success ...'

sleep 1

gum style \
	--foreground 22 --background 47 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating apt-get (update) ...'

# Run apt update and-get capture output
sudo apt-get update | while IFS= read -r line; do
  # Log each line using gum
  gum log --prefix="APT-GET UPDATE" --level="info" --message.foreground="cyan" "$line"
done

# Check the exit status of apt update
if [ $? -eq 0 ]; then
  echo "   "
  gum log --prefix="SUCCESS" --message.foreground="green" "apt-get update completed successfully."
else
	echo "   "
  gum log --prefix="ERROR" --level="error" --message.foreground="red" "apt-get update failed."
fi

gum style \
	--foreground 13 --background 43 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating apt-get (upgrade -y) ...'

# Run apt-get upgrade -y and capture output
sudo apt-get upgrade -y | while IFS= read -r line; do
  # Log each line using gum
  gum log --prefix="APT-GET UPGRADE" --level="info" --message.foreground="cyan" "$line"
done

# Check the exit status of apt-get upgrade
if [ $? -eq 0 ]; then
	echo "   "
  gum log --prefix="SUCCESS" --message.foreground="green" "apt-get upgrade completed successfully."
else
	echo "   "
  gum log --prefix="ERROR" --level="error" --message.foreground="red" "apt-get upgrade failed."
fi

gum style \
	--foreground 235 --background 214 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating apt-get (autoremove) ...'

# Run apt-get autoremove -y and capture output
sudo apt-get autoremove -y | while IFS= read -r line; do
  # Log each line using gum
  gum log --prefix="APT-GET AUTOREMOVE" --level="info" --message.foreground="cyan" "$line"
done

# Check the exit status of apt-get autoremove
if [ $? -eq 0 ]; then
	echo "   "
  gum log --prefix="SUCCESS" --message.foreground="green" "apt-get autoremove completed successfully."
else
	echo "   "
  gum log --prefix="ERROR" --level="error" --message.foreground="red" "apt-get autoremove failed."
fi

gum style \
	--foreground 92 --background 42 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  apt-get update success ...'

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
	'  Homebrew update success ...'

sleep 1

# Update npm

gum style \
	--foreground 93 --background 44 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating npm ...'

# Run npm update -g and capture output
npm update -g | while IFS= read -r line; do
  # Log each line using gum
  gum log --prefix="NPM UPDATE" --level="info" --message.foreground="cyan" "$line"
done

# Check the exit status of npm update
if [ $? -eq 0 ]; then
	echo "   "
  gum log --prefix="SUCCESS" --message.foreground="green" "npm update completed successfully."
else
	echo "   "
  gum log --prefix="ERROR" --level="error" --message.foreground="red" "npm update failed."
fi

gum style \
	--foreground 92 --background 42 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  npm update success ...'

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

#!/usr/bin/zsh

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

figlet "Updateer" | /home/linuxbrew/.linuxbrew/bin/gum style --foreground 212
echo "   "
/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 212 \
	'󱑠  Full system update and upgrade'

echo "   "
echo "   "

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 154 \
	'User: '$USER

sleep 1

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 255 --background 93 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'󱑠  Updating system packages ...'

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 17 --background 47 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Running apt update ...'

# Run apt update and capture output
sudo apt update

# Check the exit status of apt update
if [ $? -eq 0 ]; then
  echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="SUCCESS" --message.foreground="green" "apt update completed successfully."
else
	echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="ERROR" --level="error" --message.foreground="red" "apt update failed."
fi

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 17 --background 43 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Running apt upgrade -y ...'

# Run apt upgrade -y and capture output
sudo apt upgrade -y

# Check the exit status of apt upgrade
if [ $? -eq 0 ]; then
	echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="SUCCESS" --message.foreground="green" "apt upgrade completed successfully."
else
	echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="ERROR" --level="error" --message.foreground="red" "apt upgrade failed."
fi

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 235 --background 214 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Running apt autoremove ...'

# Run apt autoremove -y and capture output
sudo apt autoremove -y

# Check the exit status of apt autoremove
if [ $? -eq 0 ]; then
	echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="SUCCESS" --message.foreground="green" "apt autoremove completed successfully."
else
	echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="ERROR" --level="error" --message.foreground="red" "apt autoremove failed."
fi

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 92 --background 42 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  apt update and upgrade success ...'

sleep 1

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 22 --background 47 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Running apt-get update ...'

# Run apt update and-get capture output
sudo apt-get update

# Check the exit status of apt update
if [ $? -eq 0 ]; then
  echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="SUCCESS" --message.foreground="green" "apt-get update completed successfully."
else
	echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="ERROR" --level="error" --message.foreground="red" "apt-get update failed."
fi

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 13 --background 43 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Running apt-get upgrade -y ...'

# Run apt-get upgrade -y and capture output
sudo apt-get upgrade -y

# Check the exit status of apt-get upgrade
if [ $? -eq 0 ]; then
	echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="SUCCESS" --message.foreground="green" "apt-get upgrade completed successfully."
else
	echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="ERROR" --level="error" --message.foreground="red" "apt-get upgrade failed."
fi

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 235 --background 214 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Running apt-get autoremove ...'

# Run apt-get autoremove -y and capture output
sudo apt-get autoremove -y

# Check the exit status of apt-get autoremove
if [ $? -eq 0 ]; then
	echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="SUCCESS" --message.foreground="green" "apt-get autoremove completed successfully."
else
	echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="ERROR" --level="error" --message.foreground="red" "apt-get autoremove failed."
fi

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 92 --background 42 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  apt-get update and upgrade success ...'

sleep 1

# Update Homebrew

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 195 --background 21 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating Homebrew ...'

/home/linuxbrew/.linuxbrew/bin/brew update && /home/linuxbrew/.linuxbrew/bin/brew upgrade

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 92 --background 42 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Homebrew update and upgrade success ...'

sleep 1

# Update npm

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 93 --background 44 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Updating npm ...'

# Run npm update -g and capture output
/home/linuxbrew/.linuxbrew/bin/npm update -g | while IFS= read -r line; do
  # Log each line using /home/linuxbrew/.linuxbrew/bin/gum
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="NPM UPDATE" --level="info" --message.foreground="cyan" "$line"
done

# Check the exit status of npm update
if [ $? -eq 0 ]; then
	echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="SUCCESS" --message.foreground="green" "npm update completed successfully."
else
	echo "   "
  /home/linuxbrew/.linuxbrew/bin/gum log --prefix="ERROR" --level="error" --message.foreground="red" "npm update failed."
fi

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 92 --background 42 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  npm update success ...'

sleep 1

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 93 --background 44 \
	--align center --width 50 --margin "2 2" --padding "1 1" \
	'  Running npm doctor ...'

/home/linuxbrew/.linuxbrew/bin/npm doctor

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 212 --border-foreground 35 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'󱑠  System update complete.'

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 212\
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'Press "Ener" key to exit ...'

read

/home/linuxbrew/.linuxbrew/bin/gum style \
	--foreground 212\
	--align center --width 50 --margin "1 2" --padding "2 4" \
	'Quitting in 5 seconds ...'

sleep 5

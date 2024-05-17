#!/usr/bin/zsh

# Clear the screen for a clean start
clear

echo "Nmap scan an IP address or domain." | gum style --border rounded --padding 1 --margin 1 --foreground="25"

# Prompt the user to enter an IP address or domain name with styled gum input
IP_TO_SCAN=$(gum input --placeholder "Enter an IP address or a domain name to scan" --header "nmap an IP or domain" --header.foreground="63")

# Check if IP_TO_SCAN is empty and exit if true
if [[ -z "$IP_TO_SCAN" ]]; then
  echo "No input provided. Exiting..." | gum style --foreground="124"
  exit 1
fi

# Execute the command and store the output with visual feedback using gum spin
output=$(gum spin --spinner dot --title "Scanning $IP_TO_SCAN" -- nmap -sV -sC -v $IP_TO_SCAN)

# Display the captured nmap output in a styled, scrollable viewer
echo "$output" | gum pager

clear

# Confirmation of scan completion with styling
echo "Scan completed for $IP_TO_SCAN." | gum style --border rounded --padding 1 --margin 1 --foreground="119"

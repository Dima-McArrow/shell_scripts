#!/usr/bin/zsh

echo "\n"

# Prompt the user to enter an IP address or domain name
export IP_TO_SCAN=$(gum input --header="nmap an IP or domain" --header.foreground="63" --placeholder "Enter an IP address or a domain name to scan")

# Execute the command and store the output
output=$(gum spin --spinner dot --title "Scanning $IP_TO_SCAN" -- nmap -sV -sC -v $IP_TO_SCAN)

# Display the captured nmap output
echo "$output" | gum pager
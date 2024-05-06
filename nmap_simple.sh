#!/bin/bash

# Prompt the user to enter an IP address or domain name
export IP_TO_SCAN=$(gum input --placeholder "Enter an IP address or a domain name to scan:")

# Execute the command and store the output
output=$(gum spin --spinner dot --title "Scanning $IP_TO_SCAN" -- nmap $IP_TO_SCAN)

# Display the captured nmap output
echo "$output" | gum table -p --header.foreground="37"
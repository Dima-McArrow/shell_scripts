#!/usr/bin/zsh

echo "CyberGhost VPN --> connecting --> Malta ..."

sudo cyberghostvpn --traffic --country-code MT --connect

notify-send "CyberGhost" "VPN connected --> Malta" --icon=cyberghost


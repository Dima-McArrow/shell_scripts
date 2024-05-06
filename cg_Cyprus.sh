#!/usr/bin/zsh

echo "CyberGhost VPN --> connecting --> Cyprus ..."

sudo cyberghostvpn --traffic --country-code CY --connect

notify-send "CyberGhost" "VPN connected --> Cyprus" --icon=cyberghost


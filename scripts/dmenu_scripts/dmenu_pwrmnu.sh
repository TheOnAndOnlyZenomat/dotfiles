#!/bin/sh

declare options=("⏻ shutdown
💤 suspend
🚫 logout
🔄 reboot")

choice=$(echo -e "$options" | dmenu -i -p "Powermenu: ")

case "$choice" in
	*logout) pkill -u adrian;;
	*suspend) systemctl suspend;;
	*reboot) systemctl reboot;;
	*shutdown) systemctl -i poweroff;;
esac

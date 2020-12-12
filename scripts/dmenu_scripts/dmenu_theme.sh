#!/bin/sh

check_theme () {
	st_theme=$(cat /home/adrian/suckless/st-build/config.h | tail -n1 | awk '{{print $2}}')
	dwm_theme=$(cat /home/adrian/suckless/dwm-build/config.h | tail -n1 | awk '{{print $2}}')
}

horizon_dark () {
	cd /home/adrian/suckless/st-build/
	if [[ $st_theme = 'Horizon_Dark' ]]; then
		exit 128
	fi
	mv config.h config.$st_theme.h
	mv config.Horizon_Dark.h config.h
	echo '' | dmenu -i -p 'Password' | sudo -S make clean install
	exit 0
}

gruvbox_dark () {
	cd /home/adrian/suckless/st-build/
	if [[ $st_theme = 'Gruvbox_Dark' ]]; then
		exit 128
	else
		mv config.h config.$st_theme.h
		mv config.Gruvbox_Dark.h config.h
	fi
	echo '' | dmenu -i -p 'Password' | sudo -S make clean install
	exit 0
}

check_theme
echo $st_theme
declare options=("Horizon Dark
Gruvbox Dark")

choice=$(echo -e "$options" | dmenu -i -p "Theme: ")

case "$choice" in
	Horizon*) horizon_dark;;
	Gruvbox*) gruvbox_dark;;
esac

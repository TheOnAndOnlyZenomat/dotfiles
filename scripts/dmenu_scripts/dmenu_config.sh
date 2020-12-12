#!/bin/bash

declare options=("dwm
dwmblocks
st
bspwm
lemonbar
quit")

choice=$(echo -e "$options" | dmenu -i -p "Edit config: ")

case "$choice" in
	quit)
		echo "Terminated"
		exit 1
		;;
	dwm)
		xargs st -e "nvim" "/home/adrian/suckless/dwm-build/config.h"
		;;
	dwmblocks)
		xargs st -e "nvim" "/home/adrian/.config/dwmblocks/blocks.h"
		;;
	st)
		xargs st -e "nvim" "/home/adrian/suckless/st-build/config.h"
		;;
esac

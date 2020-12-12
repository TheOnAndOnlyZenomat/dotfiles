#!/bin/sh

dldir="/home/adrian/Downloads"

ls /usr/bin/ | grep "youtube-dl"
if [ $? -gt 0 ]; then
	echo "Youtube-dl is not installed, installing..."
	sudo pacman -S youtube-dl
fi

temp=$(mktemp dl.XXXX)

choice=$(dmenu -i -p "Link to video:" < $temp)
inputlen=$(echo $choice | wc -m)
echo $inputlen
if [[ $inputlen -gt "0" ]]; then
	st -e "youtube-dl" "$choice"
	notify-send "Download finished"
else
	notify-send "Download failed, no link specified"
	break
fi

rm -rf $temp

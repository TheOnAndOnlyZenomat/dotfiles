#!/bin/sh

timerpath=/home/adrian/scripts/statusbar/timer

timer=$(cat /home/adrian/scripts/statusbar/timer)
timer=$((timer - 1))
echo $timer > $timerpath
#echo $timer
echo " $timer "
if [[ $timer -eq 0 ]]; then
	notify-send "Posturecheck"
	echo '900' > $timerpath
	paplay /usr/share/sounds/freedesktop/stereo/dialog-information.oga
fi

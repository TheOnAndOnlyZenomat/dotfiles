#if [ "$(pgrep -x "spotifyd")" > /dev/zero ]; then
playerctl metadata &>/dev/null
if [ $? -eq "0" ]; then
	if [ "$(playerctl status spotify)" = "Paused"  ]; then
		sleep 1
		echo "Paused - $(playerctl metadata --format "{{ title }} BY {{ artist }}")"
	else # Can be configured to output differently when player is paused
		sleep 1
		echo "   $(playerctl metadata --format "{{ title }} BY {{ artist }}") "
	fi
fi

#if [ $(spotifycli --playbackstatus) == "▶" ]; then
#	echo "  $(spotifycli --status) "
#else
#	echo " Paused $(spotifycli--statis) "
#fi

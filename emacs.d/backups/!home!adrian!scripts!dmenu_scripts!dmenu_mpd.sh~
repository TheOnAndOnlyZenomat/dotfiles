#!/bin/sh

if [[ -z $(pgrep ncmpcpp) ]]; then
    st -e ncmpcpp
fi

currentsong=$(mpc -f %title% | head -n1)

declare options=("play/pause
search
next
prev
volume
stop
random")

choice=$(echo -e "$options" | dmenu -i -p "$currentsong")

case "$choice" in
    play/pause)
	mpc toggle
	;;
    next)
	mpc next
       	;;
    prev)
	mpc prev
	;;
    stop)
	mpc stop
	;;
    random)
	mpc random && mpc next
	;;
    search)
	song_choice=$(mpc listall | rev | awk -F '/' '{ print $1 }' | rev | sed 's/\(.*\)..../\1/' | dmenu -i -c -l 10)
	#song_artist="$(echo $song_choice | awk -F ' - ' '{ print $1 }')"
	song_title="$(echo $song_choice | awk -F ' - ' '{ print $2 }')"
        mpc searchplay title "$song_title"  || notify-send 'Song can not be selected, Stopping'
	;;
    volume)
	mpc volume $(echo '' | dmenu -i -p 'Volume')
	;;
esac

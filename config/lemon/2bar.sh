#! /bin/sh -e

set -e

FIFO_FILE="/tmp/test2.fifo"
mkfifo "$FIFO_FILE"

trap 'trap - TERM; rm -f $FIFO_FILE; kill 0' INT TERM

# from here, we background (&) everything
# so that our traps commands actually work

~/.config/lemon/clock.sh > "$FIFO_FILE" &
~/.config/lemon/uptime.sh > "$FIFO_FILE" &
~/.config/lemon/wsind.sh > "$FIFO_FILE" &
~/.config/lemon/upgrades.sh > "$FIFO_FILE" &
~/.config/lemon/playing.sh > "$FIFO_FILE" &
~/.config/lemon/weather.sh > "$FIFO_FILE" &
~/.config/lemon/ram.sh > "$FIFO_FILE" &
~/.config/lemon/volume.sh > "$FIFO_FILE" &
~/.config/lemon/cpu.sh > "$FIFO_FILE" &
~/.config/lemon/temp.sh > "$FIFO_FILE" &

IFS='' # so that spaces are actually read
while read -r line; do
    case "$line" in
        C*) clock="${line#?}" ;;
        G*) upg_c="${line#?}" ;;
        S*) ws_in="${line#?}" ;;
        U*) utime="${line#?}" ;;
	P*) playing="${line#?}" ;;
	W*) weather="${line#?}" ;;
	M*) memory="${line#?}" ;;
	V*) volume="${line#?}" ;;
	A*) cpu="${line#?}" ;;
	T*) temp="${line#?}" ;;
    esac
    final_output="%{S+}%{l} [ $ws_in ] $volume%{c}$weather $playing $upg_c%{B-}%{r}$cpu | $temp | $memory  |  $utime  |  $clock "
    echo "$final_output"
done < "$FIFO_FILE" | lemonbar -g 1680x20 -o 0 -f "Ubuntu Nerd Font:size=11" -f "Hack nerd Font:size=11" -B \#AA192239 -u 2 | sh &

wait # so we don't background the script itself

#! /bin/sh -e
while true; do
	source /home/adrian/.config/lemon/upd_upgrades.sh
	update_file="$HOME/.cache/available_pacman_upd.cache"
	ls "$update_file" | entr printf 'G%s\n' "$(cat $update_file)"
	sleep 60
done

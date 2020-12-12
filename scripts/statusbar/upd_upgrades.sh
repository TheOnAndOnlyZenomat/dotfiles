update_file="$HOME/.cache/available_pacman_upd.cache"
checkupdates+aur | wc -l > "$update_file"

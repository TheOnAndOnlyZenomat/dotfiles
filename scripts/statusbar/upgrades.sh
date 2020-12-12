source /home/adrian/scripts/statusbar/upd_upgrades.sh
update_file="$HOME/.cache/available_pacman_upd.cache"
updates=$(cat $update_file)
#echo -e " 📦 $updates "
echo " $updates "

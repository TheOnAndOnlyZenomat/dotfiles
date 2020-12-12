pkill -x lemonbar
echo $(rm -rf /tmp/test*)
/home/adrian/.config/lemon/upd_upgrades.sh &
sleep 2
/home/adrian/.config/lemon/bar.sh & 
/home/adrian/.config/lemon/2bar.sh  &

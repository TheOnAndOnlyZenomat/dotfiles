#echo " 💽 $(awk -F "[[T ]" 'NR==1 {print $2;}' /var/log/pacman.log) "
echo " $(awk -F "[[T ]" 'NR==1 {print $2;}' /var/log/pacman.log) "

mem="$(free -h| awk '/^Mem:/ {print $3"/16Gi"}')"
#echo  " 🧠 $mem "
echo " ${mem//i} "

while true; do
mem="$(free -h| awk '/^Mem:/ {print $3 " /16Gi "}')"
echo -e "M $mem"
sleep 5
done

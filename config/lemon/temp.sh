while true; do
temp=$(sensors | awk '/^Tdie:/{print $2}')
echo "T ${temp//+} "
sleep 5
done

temp_icon="🌡"
temp=$(sensors | awk '/^Tdie:/{print $2}')
#echo "$temp_icon ${temp//+} "
echo " ${temp//+} "

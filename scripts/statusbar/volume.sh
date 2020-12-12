volume=$(pamixer --get-volume --sink combined)
if [[ $volume > "0" ]]; then
	volume_ac="🔊 $volume%"
	#echo " $volume_ac "
	echo " $volume_ac "
else
	volume_ac="🔇 muted"
	#echo " $volume_ac "
	echo " $volume_ac "
fi

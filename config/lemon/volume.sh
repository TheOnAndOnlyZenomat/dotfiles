while true; do
	volume=$(pamixer --get-volume)
	if [[ $volume > "0" ]]; then
		volume_ac="V  $volume"
		echo $volume_ac
	else
		volume_ac="V 婢 muted"
		echo $volume_ac
	fi
	sleep .5
done

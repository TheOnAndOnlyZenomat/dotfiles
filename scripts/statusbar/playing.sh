if [[ $(mpc --host '::1' --port '3030' status | tail -n2 | head -n1 | awk '{{print $1}}') == "[paused]" ]]; then
	echo ''
else
	mpc --host "::1" --port "3030" status | head -n1
fi

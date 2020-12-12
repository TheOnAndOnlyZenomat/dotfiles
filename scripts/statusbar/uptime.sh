#! /bin/sh -e
uptime_out="$(uptime -p)"
uptime_out="${uptime_out//up}"
#echo " ⬆$uptime_out "
echo " $uptime_out "
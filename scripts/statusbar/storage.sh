used=$(df -h | head -n 4 | tail -n 1 | awk -F ' ' '{{print $3}}')
total=$(df -h | head -n 4 | tail -n 1 | awk -F ' ' '{{print $2}}')
avail=$(df -h | head -n 4 | tail -n 1 | awk -F ' ' '{{print $4}}')

echo $used'/'$total $avail

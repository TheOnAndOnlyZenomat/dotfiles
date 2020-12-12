#/bin/sh

#$choice=$(find /usr/share/man/ | awk -F '/' '{{print $7}}' | awk -F '.' '{{print $1}}'| awk 'NF' | dmenu -i -p 'which man page?')

st -e $(man find /usr/share/man/ | awk -F '/' '{{print $7}}' | awk -F '.' '{{print $1}}'| awk 'NF' | dmenu -i -p 'which man page?')

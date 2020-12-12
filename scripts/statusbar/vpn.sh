#!/bin/sh

if [[ -z $(pgrep openvpn) ]]; then
	echo ' No VPN connection'
else
	echo ' VPN connected '
fi

#!/bin/sh
weather=$(curl -s wttr.in/leipzig?format="+%c+%t+-+%w")
echo " $weather "

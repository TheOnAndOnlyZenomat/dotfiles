#!/bin/sh

linenum=$(eagle | wc -l)
num=$((linenum - 2))
echo " 🗒 $num "

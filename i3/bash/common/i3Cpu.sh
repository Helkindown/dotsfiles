#!/bin/sh

use="$(($(mpstat 1 1 --dec=0 | awk '/^A/ {print "100 - " $12}')))"

echo $use%
echo $use
echo \#$($HOME/bin/colorPicker 00FF00 FF0000 $use)

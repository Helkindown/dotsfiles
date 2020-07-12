#!/bin/sh

var=$(free | awk '/^Mem:/ {print $3 "00/" $2}' | bc)

echo $var%
echo $var
echo \#$(colorPicker 00FF00 FF0000 $var)

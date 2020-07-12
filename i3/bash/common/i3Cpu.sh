#!/bin/sh

use="$(expr $(mpstat 1 1 --dec=0 | awk '/^A/ {print "100 - " $12}'))"

echo $use%
echo $use
echo \#$(colorPicker 00FF00 FF0000 $use)

#!/bin/sh

var=$(sensors | awk '/^Tccd1:/ {print $2}')
var=${var%\.*}
var=${var#[+-]}

echo $var°C
echo $var
echo \#$($HOME/bin/colorPicker 00FF00 FF0000 $(($var * 5 - 150)))

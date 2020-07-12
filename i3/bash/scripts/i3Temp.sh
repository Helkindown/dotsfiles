#!/bin/sh
var=$(sensors | awk '/^edge:/ {print $2}')
var=${var%\.*}
var=${var#[+-]}

echo $var°C
echo $var
echo \#$(colorPicker 00FF00 FF0000 $(expr $var \* 5 - 150))

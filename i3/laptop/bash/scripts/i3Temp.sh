#!/bin/sh

var=$(sensors | awk '/^Package id 0:/ {print $4}')
var=${var%\.*}
var=${var#[+-]}

echo $var°C
echo $var
echo \#$(colorPicker 00FF00 FF0000 $(($var * 5 - 150)))

#!/bin/sh

bat="$(acpi | cut -d, -f2)"

echo $bat
bat=${bat%\%}

echo $bat
echo \#$(colorPicker FF0000 00FF00  $bat)

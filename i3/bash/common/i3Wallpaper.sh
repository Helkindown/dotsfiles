#!/bin/sh

IMG_DIR="$(find $HOME/Pictures/Wallpaper/* -type d | shuf -n 1 )"

for SCREEN in $(xrandr | awk '/ connected/ { print $1 }')
do
	IMG="$(find "$IMG_DIR" -type f | shuf -n 1 )"
	COMMAND="$COMMAND --output $SCREEN --stretch \"$IMG\""
done

echo $COMMAND | xargs xwallpaper

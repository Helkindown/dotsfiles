#!/bin/sh

xwallpaper --stretch "$(find $HOME/Pictures/Wallpaper -type f | shuf -n 1)"

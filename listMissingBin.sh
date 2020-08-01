#!/bin/bash

if which which > /dev/null
then

	for elem in amixer awk bash bc cut df echo expr free fzf git i3 i3blocks mpstat newsboat pavucontrol picom scrot sensors xclip xwallpaper
	do
		which $elem &> /dev/null || res="$res\n\t-$elem"
	done

	if [ -z $res ]
	then
		echo "Your system seams to be able to use theses dotfiles,"
		echo "but still think about special font that are in use"
	else
		echo -e "Missing software : $res"
	fi
else
	echo "which is missing and is necessary for this script, aborting..."
	exit 1
fi

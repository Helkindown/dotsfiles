#!/bin/bash

if which which &> /dev/null
then

	for EXEC in amixer awk bash bc cut df echo expr flameshot free git i3 i3blocks mpstat pavucontrol picom quiterss scrot sensors xclip xwallpaper
	do
		which "${EXEC}" &> /dev/null || MISSING+="\n\t- ${EXEC}"
	done

	if [ -z $res ]
	then
		echo "Your system seems to be able to use theses dotfiles,"
		echo "but still think about special font that are in use"
	else
		echo -e "Missing software :$res"
	fi
else
	echo "which is missing and is necessary for this script, aborting..."
	exit 1
fi

#!/bin/bash

case $BLOCK_BUTTON in
	1) 
		pavucontrol & disown
esac

tmp="$(pactl list sinks | tee >(awk '/^\t*Volume:/ {print $5}') >(awk '/^\t*Mute:/ {print $2}') > /dev/null)"

if [ "$(echo $tmp | cut -d\  -f1)" = "no" ]
then
	tmp=$(echo $tmp | cut -d\  -f2)
	tmp=${tmp%\%}

	if [ $tmp -gt 50 ]
	then
		if [ $tmp -eq 100 ]
		then
			tmp=$tmp
		else
			tmp=_$tmp
		fi
	elif [ $tmp -lt 10 ]
	then
		if [ $tmp -eq 0 ]
		then
			tmp=__0
		else
			tmp=__$tmp
		fi
	else
		tmp=_$tmp
	fi

	tmp=$tmp%
else
	tmp="Mute"
fi

echo "$tmp"
echo "$tmp"

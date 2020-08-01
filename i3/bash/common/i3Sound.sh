#!/bin/sh

case $BLOCK_BUTTON in
	1) 
		pavucontrol &
esac

tmp="$(amixer sget Master | awk '/^ *Front L/ {print $5 ":"  $6}')"

if [ "$(echo $tmp | cut -d: -f2)" = "[on]" ]
then
	tmp=$(echo $tmp | cut -d: -f1)
	tmp=${tmp%\%]}
	tmp=${tmp#[}

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

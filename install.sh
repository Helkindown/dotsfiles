#!/bin/bash

# Script made by me, for me
# (please don't use this, I dont want to break your dotsfiles)

# This get us the absolute path to the root directory of this git project
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# If the directory doesn't exist, create it
[ -d "$HOME/.config" ] || mkdir "$HOME/.config"
[ -d  "$HOME/.config/bash" ] || mkdir "$HOME/.config/bash"
[ -d  "$HOME/bin" ] || mkdir "$HOME/bin"

if which i3 &> /dev/null	# If i3 is installed, we update the ~/.config/i3 and ~/.config/i3blocks directory
then

	# If the directory doesn't exist, create it. This time for i3 specific things
	[ -d "$HOME/bin/scripts" ] || mkdir "$HOME/bin/scripts"
	[ -d "$HOME/.config/i3" ] || mkdir "$HOME/.config/i3"
	[ -d "$HOME/.config/i3blocks" ] || mkdir "$HOME/.config/i3blocks"

	# Set up the picom configuration file
	ln -f "$BASEDIR/i3/picom.conf"	"$HOME/.config"

	# Update the xserverrc & xinitrc because configuring this is always a headache
	ln -f "$BASEDIR/i3/X11/xserverrc"	"$HOME/.xserverrc"
	ln -f "$BASEDIR/i3/X11/xinitrc"		"$HOME/.xinitrc"

	echo -n "Updating i3 "
	if which xbacklight &> /dev/null	# If the xbacklight utilities is installed,
	then					# we presume we need the laptop version
		echo -n laptop
		ORIGINDIR="$BASEDIR/i3/laptop"	
	else
		echo -n desktop
		ORIGINDIR="$BASEDIR/i3"
	fi
	echo " config..."

	# Link all the necessary scripts to run my i3 config
	ln -f $ORIGINDIR/bash/scripts/* $BASEDIR/i3/bash/common/* "$HOME/bin/scripts"

	# Link the i3blocks configuration file
	ln -f "$ORIGINDIR/blocks"	"$HOME/.config/i3blocks/config"
	# Link the i3 configuration file
	ln -f "$ORIGINDIR/config"	"$HOME/.config/i3/config"

	# Link the specific scripts needed for each configuration file
	ln -f $ORIGINDIR/bash/src/*	"$HOME/.config/bash"
else
	echo i3 not detected...
fi

if which termite &> /dev/null
then
	echo Updating termite...
	[ -d "$HOME/.config/termite" ] || mkdir $HOME/.config/termite
	ln -f $BASEDIR/termite/config $HOME/.config/termite/config
fi

# Link all the base dotfiles to either their base dir or
# ~/.config/bash/
ln -f "$BASEDIR/bash/aliases"		"$HOME/.config/bash"
ln -f "$BASEDIR/bash/bashrc"		"$HOME/.bashrc"
ln -f "$BASEDIR/bash/function"		"$HOME/.config/bash"
ln -f "$BASEDIR/bash/profile"		"$HOME/.profile"
ln -f "$BASEDIR/bash/inputrc"		"$HOME/.inputrc"


# Change the directory where the vimrc will be, e.i. for nvim it's ~/.config/nvim/init.vim and for Vim it's ~/.vim/vimrc
if [ -x /bin/nvim ]
then
	VIMDIR="$HOME/.config/nvim"
	[ -d "$VIMDIR" ] || mkdir "$VIMDIR"

	ln -f "$BASEDIR/vim/nvimrc" "$VIMDIR/init.vim"
	echo Updating neovim...

elif [ -x /bin/vim ]
then
	VIMDIR="$HOME/.config/nvim"
	[ -d "$VIMDIR" ] || mkdir "$VIMDIR"
	echo Updating vim...

else
	VIMDIR=""
	echo vim nor neovim is installed, not updating their config files
fi

if [ -n $VIMDIR ] 
then

	[ -d $VIMDIR/colors ] || mkdir $VIMDIR/colors
	[ -d $VIMDIR/spell  ] || mkdir $VIMDIR/spell

	ln -f "$BASEDIR/vim/vimrc"	"$HOME/.config/nvim/vimrc"
	ln -f $BASEDIR/vim/colors/*	"$HOME/.config/nvim/colors"
	ln -f $BASEDIR/vim/spell/*	"$HOME/.config/nvim/spell"

fi

[ -d $HOME/.config/git ] || mkdir $HOME/.config/git
ln -f $BASEDIR/git/* $HOME/.config/git	# Update my git config

ln -f $BASEDIR/scripts/* $HOME/bin/	# Update my normal bin scripts

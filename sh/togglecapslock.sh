#!/bin/zsh

if [[ $(xmodmap -pk | grep Caps) ]]; then
	xmodmap -e "clear lock" #disable caps lock switch
	xmodmap -e "keysym Caps_Lock = Escape" #set caps_lock as escape
fi

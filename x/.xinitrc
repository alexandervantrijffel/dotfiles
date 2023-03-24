#!/bin/sh

# merge in defaults and keymaps

if [ -f /etc/X11/xinit/.Xresources ]; then
  xrdb -merge /etc/X11/xinit/.Xresources
fi

if [ -f "$HOME/.config/X11/.Xresources" ]; then
  xrdb -merge $HOME/.config/X11/.Xresources
fi


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

type vmware-user 1> /dev/null && vmware-user --no-startup-d &> /dev/null

exec i3

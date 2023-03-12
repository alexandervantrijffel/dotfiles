#!/bin/sh

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_SCALE_FACTOR=2

# merge in defaults and keymaps

if [ -f /etc/X11/xinit/.Xresources ]; then
  xrdb -merge /etc/X11/xinit/.Xresources
fi

if [ -f "$XDG_CONFIG_HOME/X11/.Xresources" ]; then
  xrdb -merge $XDG_CONFIG_HOME/X11/.Xresources
fi


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

type vmware-user 1> /dev/null && vmware-user --no-startup-d &> /dev/null

exec i3

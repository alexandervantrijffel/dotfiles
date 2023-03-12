#!/bin/zsh
THISDIR=$(dirname ${0:A}) 

if [ ! -d $XDG_CONFIG_HOME/X11 ]; then
    mkdir -p $XDG_CONFIG_HOME/X11
    togglexdpi
fi


[ ! -L $XDG_CONFIG_HOME/X11/.Xresources ] && {
  . $THISDIR/togglexdpi.zsh
}

[ ! -L $XDG_CONFIG_HOME/X11/.xinitrc ] && {
 ln -s $THISDIR/.xinitrc $XDG_CONFIG_HOME/X11/.xinitrc
}

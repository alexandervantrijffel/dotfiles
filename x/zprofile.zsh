#!/bin/zsh
THISDIR=$(dirname ${0:A}) 

if [ ! -d $XDG_CONFIG_HOME/X11 ]; then
    mkdir -p $XDG_CONFIG_HOME/X11
    . $THISDIR/togglexdpi.zsh
    togglexdpi
fi


#!/bin/zsh
THISDIR=$(dirname ${0:A}) 

if [ ! -d $HOME/.config/X11 ]; then
    mkdir -p $HOME/.config/X11
    . $THISDIR/togglexdpi.zsh
    togglexdpi
fi

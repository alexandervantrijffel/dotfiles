#!/bin/zsh
THISDIR=${0:a:h}

[ ! -L $XDG_CONFIG_HOME/picom/picom.conf ] && mkdir -p $XDG_CONFIG_HOME/picom && ln -s $THISDIR/picom.conf $XDG_CONFIG_HOME/picom/picom.conf

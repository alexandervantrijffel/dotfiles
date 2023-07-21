#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

[ ! -L $XDG_CONFIG_HOME/picom/picom.conf ] && mkdir -p $XDG_CONFIG_HOME/picom && ln -s $THISDIR/picom.conf $XDG_CONFIG_HOME/picom/picom.conf

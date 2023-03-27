#!/bin/zsh
THISDIR=${0:a:h}

if [[ ! -L $XDG_CONFIG_HOME/qutebrowser/autoconfig.yml ]];then
  mkdir -p $XDG_CONFIG_HOME/qutebrowser
  ln -s $THISDIR/autoconfig.yml $XDG_CONFIG_HOME/qutebrowser/
fi

#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [[ ! -L $XDG_CONFIG_HOME/qutebrowser/autoconfig.yml ]];then
  mkdir -p $XDG_CONFIG_HOME/qutebrowser
  ln -s $THISDIR/autoconfig.yml $XDG_CONFIG_HOME/qutebrowser/
fi

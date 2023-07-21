#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
[ ! -L $XDG_CONFIG_HOME ] && {
  [ ! -L $XDG_CONFIG_HOME/.ripgreprc ] && ln -s $THISDIR/.ripgreprc $XDG_CONFIG_HOME/
}

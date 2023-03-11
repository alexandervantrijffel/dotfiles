#!/bin/zsh
THISDIR=${0:a:h}
[ ! -L $XDG_CONFIG_HOME ] && {
  ln -s $THISDIR/.ripgreprc $XDG_CONFIG_HOME/
}

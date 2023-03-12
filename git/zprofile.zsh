#!/bin/zsh
THISDIR=${0:a:h}

if [ ! -L $XDG_CONFIG_HOME/git/config ]; then
  mkdir -p $XDG_CONFIG_HOME/git
  ln -sf $THISDIR/.gitconfig $XDG_CONFIG_HOME/git/config
fi

if [ ! -L $XDG_CONFIG_HOME/git/ignore ]; then
  mkdir -p $XDG_CONFIG_HOME/git
  ln -sf $THISDIR/.gitignore $XDG_CONFIG_HOME/git/ignore
fi

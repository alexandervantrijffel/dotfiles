#!/bin/zsh
THISDIR=${0:a:h}

[ ! -d $HOME/.cache/.vimundo ] && mkdir -p $HOME/.cache/.vimundo/

TSMOD="$XDG_CONFIG_HOME/nvim/lua/tsserver"
if [[ ! -f "${TSMOD}/init.lua" ]]; then 
  mkdir -p $TSMOD 
  ln -s $THISDIR/tsserver/init.lua $TSMOD/init.lua
fi

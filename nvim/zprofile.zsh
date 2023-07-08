#!/bin/zsh
THISDIR=${0:a:h}

[ ! -d $HOME/.cache/.vimundo ] && mkdir -p $HOME/.cache/.vimundo/

PLUGINFILE=$HOME/.local/share/nvim/site/pack/packer/start/which-key.nvim/lua/which-key/plugins/custommarks.lua
[ ! -f $PLUGINFILE ] && ln -s $THISDIR/lua/whichkey-plugin-custommarks.lua $PLUGINFILE
unset - PLUGINFILE

#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

[ ! -d $HOME/.cache/.vimundo ] && mkdir -p $HOME/.cache/.vimundo/

PLUGINFILE=$HOME/.local/share/nvim/site/pack/packer/start/which-key.nvim/lua/which-key/plugins/custommarks.lua
[ ! -f $PLUGINFILE ] && ln -s $THISDIR/lua/whichkey-plugin-custommarks.lua $PLUGINFILE
unset - PLUGINFILE

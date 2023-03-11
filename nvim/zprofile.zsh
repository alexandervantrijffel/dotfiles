#!/bin/zsh
THISDIR=${0:a:h}

#
# if ! type nvim 1>/dev/null; then
#   sudo apt install neovim
# fi
# 
# if type nvim 1>/dev/null; then
#   if [ -d $HOME/.SpaceVim ]; then
#       [[ -d $HOME/.SpaceVim.d ]] || ln -s ${0:A:h}/.SpaceVim.d $HOME/
#   fi
#   if [[ ! -d "$HOME/.SpaceVim" ]]; then 
#     curl -sLf https://spacevim.org/install.sh | bash
#     read start nvim in a new terminal, run :SPupdate, and continue here
#     (cd $HOME/.cache/vimfiles/repos/github.com/neoclide/coc.nvim; yarn install && yarn build)
#   fi
# fi
# COCSET=$HOME/.SpaceVim/coc-settings.json
# if [[ ! -L $COCSET ]];then  
#   ln -s $THISDIR/coc-settings.json $COCSET
# fi

mkdir -p $HOME/.vimundo/

TSMOD="$XDG_CONFIG_HOME/nvim/lua/tsserver"
if [[ ! -L "${TSMOD}/init.lua" ]]; then 
  mkdir -p $TSMOD 
  ln -s $THISDIR/tsserver/init.lua $TSMOD/init.lua
fi

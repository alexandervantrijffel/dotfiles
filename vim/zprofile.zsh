#!/bin/zsh
#
if ! type nvim 1>/dev/null; then
  sudo apt install neovim
fi

if type nvim 1>/dev/null; then
  if [ -d $HOME/.SpaceVim ]; then
      [[ -d $HOME/.SpaceVim.d ]] || ln -s ${0:A:h}/.SpaceVim.d $HOME/
  fi
  if [[ ! -d "$HOME/.SpaceVim" ]]; then 
    curl -sLf https://spacevim.org/install.sh | bash
    read start nvim in a new terminal, run :SPupdate, and continue here
    (cd $HOME/.cache/vimfiles/repos/github.com/neoclide/coc.nvim; yarn install && yarn build)
  fi
fi

mkdir -p $HOME/.vimundo/

TSMOD=$HOME/.config/nvim/lua/tsserver
[ ! -f $TSMOD/init.lua ] && mkdir -pv $TSMOD && ln -s $THISDIR/tsserver/init.lua $TSMOD/init.lua

COCSET=$HOME/.SpaceVim/coc-settings.json
[ ! -f $COCSET ] && ln -s $THISDIR/coc-settings.json $COCSET


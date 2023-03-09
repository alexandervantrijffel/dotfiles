#!/bin/zsh
THISDIR=${0:a:h}

# this is required to prevent that zsh-vim-mode overwrites CTRL-R of fzf and tab of fzf-tab
export VIM_MODE_NO_DEFAULT_BINDINGS=true

if type nvim 1>/dev/null; then
  alias v="$(which nvim)"
else
  alias v="vi"
fi

. $THISDIR/touchp.sh

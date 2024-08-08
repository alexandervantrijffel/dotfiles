#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# this is required to prevent that zsh-vim-mode overwrites CTRL-R of fzf and tab of fzf-tab
export VIM_MODE_NO_DEFAULT_BINDINGS=true

unset v
if type nvim 1>/dev/null; then
  # start with fzf search mode
  alias v="$(which nvim)"
  # start with rg search mode
  alias vf="$(which nvim) +Rg"

  alias .d="z $DOTFILES"
  alias .v="z $DOTFILES && v"
  alias .vf="z $DOTFILES && v +Rg"
else
  alias v="vi"
fi

. $THISDIR/touchp.sh

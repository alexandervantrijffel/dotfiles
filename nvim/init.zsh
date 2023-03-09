#!/bin/zsh
THISDIR=${0:a:h}

zplug "softmoth/zsh-vim-mode"

# this is required to prevent that zsh-vim-mode overwrites CTRL-R of fzf and tab of fzf-tab
export VIM_MODE_NO_DEFAULT_BINDINGS=true

# for softmoth/zsh-vim-mode
bindkey 'jj' vi-cmd-mode
# for jeffreytse/zsh-vi-mode
# export ZVM_VI_ESCAPE_BINDKEY=jj

if type nvim 1>/dev/null; then
  alias v="$(which nvim)"
else
  alias v="vi"
fi

. $THISDIR/touchp.sh

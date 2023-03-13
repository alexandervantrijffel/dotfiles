#!/bin/zsh
THISDIR=${0:a:h}

# this is required to prevent that zsh-vim-mode overwrites CTRL-R of fzf and tab of fzf-tab
export VIM_MODE_NO_DEFAULT_BINDINGS=true

znap source "softmoth/zsh-vim-mode"

# for softmoth/zsh-vim-mode
bindkey 'jj' vi-cmd-mode

# Press C-v in insert mode or normal/command mode for editing the command line in the default editor
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
bindkey -M vicmd '^v' edit-command-line
bindkey -M viins '^v' edit-command-line

# exit with C-q
exit_zsh() { exit }
autoload exit_zsh; zle -N exit_zsh
bindkey '^q' exit_zsh
# repeat last command
bindkey -s '^l' '!!^M^M'
# vi editing mode
bindkey -v 

bindkey -M vicmd '^q' exit_zsh
bindkey -M viins '^q' exit_zsh

unset v
if type nvim 1>/dev/null; then
  # start with fzf search mode
  alias v="$(which nvim)"
  # start with rg search mode
  alias vg="$(which nvim) +Rg"

  alias .d="z $DOTFILES"
  alias .v="z $DOTFILES && v"
  alias .vg="z $DOTFILES && v +Rg"
else
  alias v="vi"
fi

. $THISDIR/touchp.sh

#!/bin/zsh
THISDIR=${0:a:h}

#
znap source "softmoth/zsh-vim-mode"

# Press C-v in insert mode or normal/command mode for editing the command line in the default editor
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
bindkey -M vicmd '^v' edit-command-line
bindkey -M viins '^v' edit-command-line

# my life is complete now
# 
# to normal mode with jj  

# for softmoth/zsh-vim-mode
bindkey 'jj' vi-cmd-mode

# for jeffreytse/zsh-vi-mode
# ZVM_VI_ESCAPE_BINDKEY=jj

# life is even completer now
#
# exit with C-q
exit_zsh() { exit }
autoload exit_zsh; zle -N exit_zsh
bindkey '^q' exit_zsh
# repeat last command
bindkey -s '^l' '!!^M^M'
# vi editing mode
bindkey -v 

# for jeffreytse/zsh-vi-mode
bindkey -M vicmd '^q' exit_zsh
bindkey -M viins '^q' exit_zsh

# this is required to prevent that zsh-vim-mode overwrites CTRL-R of fzf and tab of fzf-tab
export VIM_MODE_NO_DEFAULT_BINDINGS=true

unset v
if type nvim 1>/dev/null; then
  alias v="$(which nvim)"
else
  alias v="vi"
fi

. $THISDIR/touchp.sh

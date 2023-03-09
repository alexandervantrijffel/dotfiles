#!/bin/zsh
THISDIR=${0:a:h}


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

# for jeffreytse/zsh-vi-mode
bindkey -M vicmd '^q' exit_zsh
bindkey -M viins '^q' exit_zsh


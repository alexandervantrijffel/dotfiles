zplug "softmoth/zsh-vim-mode"

if type nvim 1>/dev/null; then
  alias v="$(which nvim)"
  export EDITOR=nvim
  export VISUAL=nvim
else
  alias v="vi"
  export EDITOR=vi
  export VISUAL=vi
fi

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
# export ZVM_VI_ESCAPE_BINDKEY=jj

# life is even completer now
#
# exit with C-q
exit_zsh() { exit }
autoload exit_zsh; zle -N exit_zsh
bindkey '^q' exit_zsh

# for jeffreytse/zsh-vi-mode
bindkey -M vicmd '^q' exit_zsh
bindkey -M viins '^q' exit_zsh

# this is required to prevent that zsh-vim-mode overwrites CTRL-R of fzf and tab of fzf-tab
export VIM_MODE_NO_DEFAULT_BINDINGS=true

mkdir -p $HOME/.vimundo/

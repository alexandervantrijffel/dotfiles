#!/bin/zsh
# unfortunately we have to repeat this after zsh-vim-mode has been loaded

source $ZPLUG_REPOS/junegunn/fzf/shell/key-bindings.zsh
source $ZPLUG_REPOS/junegunn/fzf/shell/completion.zsh

export FZF_DEFAULT_OPTS="--bind 'ctrl-l:up,ctrl-k:down,ctrl-a:select-all,ctrl-d:preview-page-down,ctrl-u:preview-page-up' --cycle --ansi --height 80%"

MY_DEFAULT_COMMAND_OPTS='--hidden --follow --no-ignore --exclude .git --exclude node_modules --exclude dist --exclude coverage --exclude test-reports --exclude .build --exclude build --exclude .serverless --exclude .venv --exclude .pytest_cache --exclude __pycache__ --exclude pygreet.egg-info --exclude .nox --exclude .cache --exclude .next --exclude .eslintcache'
# used by ctrl+p in vim and when running fzf without arguments
export FZF_DEFAULT_COMMAND="fd --type file $MY_DEFAULT_COMMAND_OPTS"

export FZF_CTRL_T_COMMAND="fd --type directory $MY_DEFAULT_COMMAND_OPTS"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type directory"

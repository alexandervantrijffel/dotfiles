zplug "junegunn/fzf", \
  as:command, \
  hook-build: "rm -f $ZPLUG_HOME/bin/fzf && $ZPLUG_REPOS/junegunn/fzf/install --bin", \
  use:"bin/{fzf,fzf-tmux}", \
  hook-load: """

source $ZPLUG_REPOS/junegunn/fzf/shell/key-bindings.zsh
source $ZPLUG_REPOS/junegunn/fzf/shell/completion.zsh
  """, \
  defer:3

# zplug "junegunn/fzf", \
# lincheney/fzf-tab-completion

#  && sudo ln -sr bin/fzf $ZPLUG_HOME/bin"


# make sure python is available. Check `zplug --log` in case of errors

# use fzf for completion anywhere after pressing TAB
zplug "aloxaf/fzf-tab", \
  hook-load: """
source $ZPLUG_REPOS/aloxaf/fzf-tab/fzf-tab.plugin.zsh
  """, \
  defer:3

FZF_DEFAULT_OPTS="--bind 'ctrl-l:up,ctrl-k:down,ctrl-a:select-all,ctrl-d:preview-page-down,ctrl-u:preview-page-up' --cycle --ansi --height 80%"

MY_DEFAULT_COMMAND_OPTS='--hidden --follow --no-ignore --exclude .git --exclude node_modules --exclude dist --exclude coverage --exclude test-reports --exclude .build --exclude build --exclude .serverless --exclude .venv --exclude .pytest_cache --exclude __pycache__ --exclude pygreet.egg-info --exclude .nox --exclude .cache --exclude .next --exclude .eslintcache'

# used by ctrl+p in vim and when running fzf without arguments
FZF_DEFAULT_COMMAND="fd --type file $MY_DEFAULT_COMMAND_OPTS"

FZF_CTRL_T_COMMAND="fd --type file $MY_DEFAULT_COMMAND_OPTS"
FZF_ALT_C_COMMAND="fd --type directory $MY_DEFAULT_COMMAND_OPTS"


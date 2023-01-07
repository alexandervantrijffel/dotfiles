zplug "junegunn/fzf", \
  as:command, \
  hook-build: "rm -f $ZPLUG_HOME/bin/fzf && $ZPLUG_REPOS/junegunn/fzf/install --bin", \
  use:"bin/{fzf,fzf-tmux}", \
  hook-load: """

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

source $ZPLUG_REPOS/junegunn/fzf/shell/key-bindings.zsh
source $ZPLUG_REPOS/junegunn/fzf/shell/completion.zsh

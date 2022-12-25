zplug "junegunn/fzf", \
  use:"shell/*.zsh", \
  hook-build: "rm -f $ZPLUG_HOME/bin/fzf && $ZPLUG_REPOS/junegunn/fzf/install --bin && ln -s bin/fzf $ZPLUG_HOME/bin"

# make sure python is available. Check `zplug --log` in case of errors

# use fzf for completion anywhere after pressing TAB
zplug "aloxaf/fzf-tab", defer:3

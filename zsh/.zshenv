FILENAME=${0:A:h}
DOTFILES=$(readlink -e "$HOME/.zshenv" | xargs dirname | xargs dirname)
export ZDOTDIR="${DOTFILES}/zsh"
echo ZDOTDIR=$ZDOTDIR

# make sure the autosuggestions color differs from the solarized dark background color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

setopt MENU_COMPLETE  # select first menu option automatically
setopt NO_NOMATCH  # stop zsh from catching ^ chars.
setopt PROMPT_SUBST  # prompt substitution
setopt AUTO_CONTINUE

# # fix rider showing on Wayland
# export _JAVA_AWT_WM_NONREPARENTING=1

export LC_ALL=en_US.UTF-8

export ANDROID_SDK=$HOME/Android/Sdk
export ANDROID_HOME=$ANDROID_SDK
export ANDROID_SDK_ROOT=$ANDROID_SDK
export ANDROID_AVD_HOME=$HOME/.android/avd

unset JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-1.14.0-openjdk-amd64

[ -d  "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"
[ -d  "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"

# support for compdef (completions for zsh)
autoload -Uz compinit
compinit -u

for f in $DOTFILES/**/env.zsh; do 
  source "$f"
done

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1

source /etc/profile

[ -e "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

alias grep="grep -i --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}"


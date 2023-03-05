FILENAME=${0:A:h}
DOTFILES=$(readlink -e "$HOME/.zshenv" | xargs dirname | xargs dirname)
export ZDOTDIR="${DOTFILES}/zsh"

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

export LC_ALL=en_US.UTF-8

export ANDROID_SDK=$HOME/Android/Sdk
export ANDROID_HOME=$ANDROID_SDK
export ANDROID_SDK_ROOT=$ANDROID_SDK
export ANDROID_AVD_HOME=$HOME/.android/avd

[ -d  "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"
[ -d  "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"

# support for compdef (completions for zsh)
autoload -Uz compinit
compinit -d $HOME/.cache/.zcompdump-$HOST
compinit -u

for f in $DOTFILES/**/env.zsh; do 
  source "$f"
done

source /etc/profile

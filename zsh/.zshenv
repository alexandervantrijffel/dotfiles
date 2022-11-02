FILENAME=${0:A:h}
DOTFILES=$(readlink -e "$HOME/.zshrc" | xargs dirname | xargs dirname)

# make sure the autosuggestions color differs from the solarized dark background color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

export LC_ALL=en_US.UTF-8

# aliases are here in .zshenv so that they are also available
# in the vim command line

alias .d="cd $DOTFILES"
alias .v="cd $DOTFILES && v"

if type ag 1>/dev/null; then
  alias ag='ag -p ~/.gitignore --hidden --all-types --ignore-case --one-device --pager "less -R" '
fi
if type batcat 1>/dev/null; then
  alias cat='batcat -p '
fi
if type bat 1>/dev/null; then
  alias cat='bat -p '
fi
if type pydf 1>/dev/null; then
  alias df="pydf"
fi
alias du="du -h --max-depth=1 "
alias dus="du | sort -h"
alias fdh="fd --hidden --no-ignore "
if type htop 1>/dev/null; then
  alias top="sudo htop" # alias top and fix high sierra bug
fi
alias lps="lpass show -x -G "
alias md5sum=$'md5sum | awk -F \' \' \'{print $1}\' | tee /dev/tty | pbcopy'
alias open='xdg-open'
if ! type pbcopy 1>/dev/null; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi
alias pass="date +%s | sha256sum | base64 | head -c 24 | tee /dev/tty | pbcopy"
alias psg="ps -a | grep $1"
alias pwd="pwd -L"
alias rm="rm -rf "
alias sudo="sudo -E "
alias _="sudo "
alias t="terminator --working-directory=\$(pwd)"
alias yrs="yarn run start &"

export ANDROID_SDK=$HOME/Android/Sdk
export ANDROID_HOME=$ANDROID_SDK
export ANDROID_SDK_ROOT=$ANDROID_SDK
export ANDROID_AVD_HOME=$HOME/.android/avd

unset JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-1.14.0-openjdk-amd64

[ -d  "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"
[ -d  "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"

for f in $DOTFILES/**/env.zsh; do 
  source "$f"
done


[ -e "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

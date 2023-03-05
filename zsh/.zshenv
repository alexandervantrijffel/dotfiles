FILENAME=${0:A:h}
DOTFILES=$(readlink -e "$HOME/.zshenv" | xargs dirname | xargs dirname)
export ZDOTDIR="${DOTFILES}/zsh"

export LC_ALL=en_US.UTF-8

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

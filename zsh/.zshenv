#!/bin/zsh

##
# order:
# .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
#
# .zshenv: sourced both for interactive and non interactive shells

export DOTFILES=$(readlink -e "$HOME/.zshenv" | xargs dirname | xargs dirname)
export ZDOTDIR="${DOTFILES}/zsh"

# start profiling (finish in .zshrc)
# zmodload zsh/zprof

export LC_ALL=en_US.UTF-8

if [[ ! -f "/tmp/.zprofiled" ]]; then
    touch /tmp/.zprofiled
fi

for f in $DOTFILES/**/preenv.zsh; do
    . "$f"
done

for f in $DOTFILES/**/env.zsh; do
    . "$f"
done

[ -d  "$HOME/bin" ] && PATH="$PATH:$HOME/bin"
[ -d  "$HOME/.local/bin" ] && PATH="$PATH:$HOME/.local/bin"

alias assume=". assume"

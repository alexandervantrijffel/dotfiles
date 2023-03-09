#!/bin/zsh

# .zprofile: sourced in login shell

# support for compdef (completions for zsh)
autoload -Uz compinit
compinit -d $HOME/.cache/.zcompdump-$HOST
compinit -u

if [ -z "$ZSH_VERSION" ]; then
  echo "Please use zsh"
  exit 1
fi

#!/bin/zsh

# .zprofile: sourced in login shell

# support for compdef (completions for zsh)
export ZSH_DISABLE_COMPFIX="true"
autoload -Uz compinit
compinit -d $HOME/.cache/.zcompdump-$HOST -i
compinit -u

if [ -z "$ZSH_VERSION" ]; then
  echo "Please use zsh"
  exit 1
fi

 mkdir -p /opt/fromgit/
git clone --depth 1 https://github.com/romkatv/zsh-defer.git /opt/fromgit/zsh-defer

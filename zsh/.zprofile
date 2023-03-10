#!/bin/zsh
THISDIR=${0:a:h}

# .zprofile: sourced in login shell

if [ ! -L ~/.zshenv ]; then
  ln -s $THISDIR/.zshenv ~/
fi

# support for compdef (completions for zsh)
export ZSH_DISABLE_COMPFIX="true"
autoload -Uz compinit
compinit -d $HOME/.cache/.zcompdump-$HOST -i
compinit -u

if [ -z "$ZSH_VERSION" ]; then
  echo "Please use zsh"
  exit 1
fi

if [ ! -d "/opt/fromgit/zsh-defer" ]; then
  mkdir -p /opt/fromgit/
  git clone --depth 1 https://github.com/romkatv/zsh-defer.git /opt/fromgit/zsh-defer
fi

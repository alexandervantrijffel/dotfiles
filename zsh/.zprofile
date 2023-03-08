#!/bin/zsh

# .zprofile: sourced in login shell

if [ -z "$ZSH_VERSION" ]; then
  echo "Please use zsh"
  exit 1
fi

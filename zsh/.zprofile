#!/bin/zsh
#
if [ -z "$ZSH_VERSION" ]; then
  echo "Please use zsh"
  exit 1
fi

for f in $DOTFILES/**/zprofile.zsh; do 
  source "$f"
done


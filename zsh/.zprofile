#!/bin/zsh

# .zprofile: sourced in login shell

echo "zsh/zprofile executed" >> /home/lex/.zprofile.log

if [ -z "$ZSH_VERSION" ]; then
  echo "Please use zsh"
  exit 1
fi

for f in $DOTFILES/**/zprofile.zsh; do 
  . "$f"
done

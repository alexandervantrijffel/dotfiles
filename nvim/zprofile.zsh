#!/bin/zsh

if [ ! -L $HOME/.config/nvim ]; then
  ln -s ${0:a:h}/ $HOME/.config/
fi

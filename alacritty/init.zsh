#!/usr/bin/sh
# register .zsh_functions with alacritty completions
export PATH="$PATH:${DOTFILES:-~}/.zsh_functions"

FOLDER=$HOME/.config/alacritty
mkdir -pv $FOLDER

CURDIR=$(dirname ${0:A})  
[ ! -e $FOLDER/alacritty.yml ] && ln -s $CURDIR/alacritty.yml $FOLDER/alacritty.yml

[ ! -e /usr/share/applications/alacritty.desktop ] && ln -s $CURDIR/alacritty.desktop /usr/share/applications/alacritty.desktop

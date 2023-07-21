#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

TARGETFOLDER=$XDG_CONFIG_HOME/alacritty
mkdir -pv $TARGETFOLDER

[ ! -L /usr/share/applications/alacritty.desktop ] && sudo ln -s $CURDIR/alacritty.desktop /usr/share/applications/alacritty.desktop

. ${DOTFILES}/x/functions/ishidpi

if [[ $(lsb_release -a 2>/dev/null) =~ "Arch" ]]; then 
  if ishidpi; then
    ln -sf $THISDIR/alacritty.arch.hidpi.yml $TARGETFOLDER/alacritty.yml
  else 
    echo picking lodpi
    ln -sf $THISDIR/alacritty.arch.lodpi.yml $TARGETFOLDER/alacritty.yml
  fi
else
  [ ! -L $TARGETFOLDER/alacritty.yml ] && \
    ln -sf $THISDIR/alacritty.yml $TARGETFOLDER/alacritty.yml
fi

#!/bin/zsh

function ishidpi() {
  local PREFFILE=$HOME/.config/X11/.Xresources-dpi-preference
  if [ -s $PREFFILE ]; then
    local CURPREF=$(cat $PREFFILE)
  else
    local CURPREF=lodpi
  fi

  [[ $CURPREF =~ "hidpi" ]] && return

  false
}

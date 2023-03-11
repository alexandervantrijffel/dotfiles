#!/bin/zsh

function ishidpi() {
  local PREFFILE=$XDG_CONFIG_HOME/X11/.Xresources-dpi-preference
  if [ -s $PREFFILE ]; then
    local CURPREF=$(cat $PREFFILE)
  else
    local CURPREF=lodpi
  fi

  [[ $CURPREF =~ "hidpi" ]] && return

  false
}

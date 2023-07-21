#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ ! -d $XDG_CONFIG_HOME/X11 ]; then
    mkdir -p $XDG_CONFIG_HOME/X11
    togglexdpi
fi


[ ! -L $XDG_CONFIG_HOME/X11/.Xresources ] && {
  . $THISDIR/togglexdpi.zsh
}

[ ! -L $XDG_CONFIG_HOME/X11/.xinitrc ] && {
 ln -s $THISDIR/.xinitrc $XDG_CONFIG_HOME/X11/.xinitrc
}

. $THISDIR/functions/ishidpi
if ishidpi; then
  export GDK_SCALE=2
  export GDK_DPI_SCALE=0.5
  export QT_SCALE_FACTOR=2
else
  export GDK_SCALE=1
  export GDK_DPI_SCALE=1
  export QT_SCALE_FACTOR=1
fi

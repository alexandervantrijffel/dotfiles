#!/usr/bin/zsh

PREFFILE=$HOME/.Xresources-dpi-preference
if [ -s $PREFFILE ]; then
  CURPREF=$(cat $PREFFILE)
else
  CURPREF=lodpi
fi

if [[ $CURPREF =~ "hidpi" ]]; then
  echo "Activating hidpi"
  export GDK_SCALE=2
  export GDK_DPI_SCALE=0.5
  export QT_AUTO_SCREEN_SCALE_FACTOR=1
else
  echo "Activating lodpi"
  export GDK_SCALE=1
  export GDK_DPI_SCALE=1.0
  export QT_AUTO_SCREEN_SCALE_FACTOR=1
fi

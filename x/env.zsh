#!/usr/bin/zsh

CURPREF=$(cat $HOME/.Xresources-dpi-preference)
echo curpref is $CURPREF
if [[ $CURPREF =~ "hidpi" ]]; then
  echo "setting hidpi"
  export GDK_SCALE=2
  export GDK_DPI_SCALE=0.5
  export QT_AUTO_SCREEN_SCALE_FACTOR=1
else
  echo "setting lodpi"
  export GDK_SCALE=1
  export GDK_DPI_SCALE=1.0
  export QT_AUTO_SCREEN_SCALE_FACTOR=1
fi

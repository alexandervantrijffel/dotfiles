#!/bin/zsh
. ${0:a:h}/togglexdpi.zsh

PREFFILE=$HOME/.config/X11/.Xresources-dpi-preference
if [ -s $PREFFILE ]; then
  CURPREF=$(cat $PREFFILE)
else
  CURPREF=lodpi
fi

if [[ $CURPREF =~ "hidpi" ]]; then
  if type notify-send 1>/dev/null; then
    notify-send -i display "Activating hidpi"
  fi 
  export GDK_SCALE=2
  export GDK_DPI_SCALE=0.5
  export QT_SCALE_FACTOR=2
  xrandr --output Virtual-1 --auto --pos 0x0 --rotate normal --dpi 227 --primary --filter nearest --primary
else
  if type notify-send 1>/dev/null; then
    notify-send -i display "Activating lodpi"
  fi 
  export QT_SCALE_FACTOR=1
  export GDK_SCALE=1
  export GDK_DPI_SCALE=1.0
  xrandr --output Virtual-1 --auto --pos 0x0 --rotate normal --dpi 110 --primary --filter nearest --primary
fi
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_ENABLE_HIGHDPI_SCALING=1


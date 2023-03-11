#!/bin/zsh
. ${0:a:h}/togglexdpi.zsh

func () {
  local PREFFILE=$HOME/.config/X11/.Xresources-dpi-preference
  if [ -s $PREFFILE ]; then
    local CURPREF=$(cat $PREFFILE)
  else
    local CURPREF=lodpi
  fi

  if [[ $CURPREF =~ "hidpi" ]]; then
    if type notify-send 1>/dev/null; then
      notify-send -i display "Activating hidpi"
    fi 
    GDK_SCALE=2
    GDK_DPI_SCALE=0.5
    QT_AUTO_SCREEN_SCALE_FACTOR=1
    xrandr --output Virtual-1 --auto --mode 2560x1600 --pos 0x0 --rotate normal --dpi 227 --primary --filter nearest
  else
    if type notify-send 1>/dev/null; then
      notify-send -i display "Activating lodpi"
    fi 

    GDK_SCALE=1
    GDK_DPI_SCALE=1.0
    QT_AUTO_SCREEN_SCALE_FACTOR=1
  fi
}
func
unset -f func

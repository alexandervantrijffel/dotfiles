#!/usr/bin/zsh
DIR=$(dirname ${0:A}) 
togglexdpi() {
  SYMLINKFILE=${HOME}/.Xresources

  CURTARGET=$(readlink ${SYMLINKFILE})

  rm -f ${SYMLINKFILE}
  # # defaults to lodpi if .Xresources file does not exist
  if [[ $CURTARGET =~ "hidpi" ]]; then
    ln -s $DIR/.Xresources.lodpi ${SYMLINKFILE} 
    echo lodpi > ${HOME}/.Xresources-dpi-preference
    if [ $? -ne 0 ]; then return $?; fi
    xrandr --output Virtual-1 --auto --mode 5120x1440 --pos 0x0 --rotate normal --dpi 110 --scale 1x1
    if type notify-send 1>/dev/null; then
      notify-send -i display "lodpi activated"
    else 
      echo lodpi acticated
    fi 
  else
    ln -s $DIR/.Xresources.hidpi ${SYMLINKFILE} 
    echo hidpi > ${HOME}/.Xresources-dpi-preference
    if [ $? -ne 0 ]; then return $?; fi
    xrandr --output Virtual-1 --auto --mode 3840x2400 --pos 0x0 --rotate normal --dpi 227 --scale 2x2
    if type notify-send 1>/dev/null; then
      notify-send -i display "hidpi activated"
    else 
      echo hidpi acticated
    fi 
  fi
  xrdb ~/.Xresources
  i3-msg restart
}
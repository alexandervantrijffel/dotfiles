#!/usr/bin/zsh
DIR=$(dirname ${0:A}) 
togglexdpi() {
  SYMLINKFILE=${HOME}/.Xresources

  CURTARGET=$(readlink ${SYMLINKFILE})

  rm -f ${SYMLINKFILE}
  # # defaults to lodpi if .Xresources file does not exit
  if [[ $CURTARGET =~ "hidpi" ]]; then
    ln -s $DIR/.Xresources.lodpi ${SYMLINKFILE} 
    if [ $? -ne 0 ]; then return $?; fi
    echo Changed to lodpi
  else
    ln -s $DIR/.Xresources.hidpi ${SYMLINKFILE} 
    if [ $? -ne 0 ]; then return $?; fi
    echo Changed to hidpi
  fi
}

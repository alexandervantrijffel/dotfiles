#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# caps lock = control key
# re-run this when plugging in another keyboard
type setxkbmap > /dev/null 2>&1 && setxkbmap -option ctrl:nocaps

stty start undef  # disable C-s stopping receiving keyboard signals.
stty stop undef

type xmodmap > /dev/null 2>&1 && {
    xmodmap $THISDIR/.Xmodmap
    sysmodmap=/etc/X11/xinit/.Xmodmap
    if [ -f $sysmodmap ]; then
        xmodmap $sysmodmap
    fi
}

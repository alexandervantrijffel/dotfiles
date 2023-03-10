#!/bin/zsh
THISDIR=${0:a:h}

# caps lock = control key
# re-run this when plugging in another keyboard
type setxkbmap > /dev/null 2>&1 && setxkbmap -option ctrl:nocaps

stty start undef  # disable C-s stopping receiving keyboard signals.
stty stop undef

# if type xmodmap > /dev/null 2>&1; then
#     xmodmap $THISDIR/.Xmodmap
# fi

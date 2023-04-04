#!/bin/zsh
THISDIR=${0:a:h}

type dunst 1>/dev/null && {
    if [[ ! -d $XDG_CONFIG_HOME/dunst ]]; then
        echo Prepare dunstrc link
        mkdir -p $XDG_CONFIG_HOME/dunst
        ln -sf $THISDIR/dunstrc $XDG_CONFIG_HOME/dunst/dunstrc
    fi
}

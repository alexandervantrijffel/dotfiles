#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

type dunst 1>/dev/null && {
    if [[ ! -d $XDG_CONFIG_HOME/dunst ]]; then
        echo Prepare dunstrc link
        mkdir -p $XDG_CONFIG_HOME/dunst
        ln -sf $THISDIR/dunstrc $XDG_CONFIG_HOME/dunst/dunstrc
    fi
}

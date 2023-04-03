#!/bin/zsh
THISDIR=$(dirname ${0:A})

if [ ! -L $HOME/.config/yay/config.json ]; then
    mkdir -p $HOME/.config/yay
    ln -s $THISDIR/config.json $HOME/.config/yay/config.json
fi

#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ ! -L $HOME/.config/yay/config.json ]; then
    mkdir -p $HOME/.config/yay
    ln -s $THISDIR/config.json $HOME/.config/yay/config.json
fi

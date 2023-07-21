#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

TGT=/usr/share/fortune
[ ! -L $TGT/vim.dat ] && {
    sudo ln -sr $THISDIR/*.dat $TGT/
    sudo ln -sr $THISDIR/shell $TGT/
    sudo ln -sr $THISDIR/vim $TGT/
}

#!/bin/zsh
THISDIR=$(dirname ${0:A})

TGT=/usr/share/fortune
[ ! -L $TGT/vim.dat ] && {
    sudo ln -sr $THISDIR/*.dat $TGT/
    sudo ln -sr $THISDIR/shell $TGT/
    sudo ln -sr $THISDIR/vim $TGT/
}

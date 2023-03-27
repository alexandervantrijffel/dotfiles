#!/bin/zsh
THISDIR=${0:a:h}

# yamllint is being used by nvim coc-diagnistics

if [ ! -L $XDG_CONFIG_HOME/yamllint/config ] ; then
    mkdir -p $XDG_CONFIG_HOME/yamllint
    ln -s $THISDIR/config $XDG_CONFIG_HOME/yamllint/config 
fi

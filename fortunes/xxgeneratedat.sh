#!/bin/zsh
THISDIR=${0:a:h}

strfile $1 $1.dat
rm -f $1.u8
ln -rs $1 $1.u8

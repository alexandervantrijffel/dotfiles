#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

strfile $1 $1.dat
rm -f $1.u8
ln -rs $1 $1.u8

#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

export RUSTC_WRAPPER=sccache
# export RUST_LOG=debug

FPATH=${FPATH}:$THISDIR/functions
autoload -z abr
autoload -z samabr

FPATH=${FPATH}:$THISDIR/functions
autoload -z ago
autoload -z ato
autoload -z atdr

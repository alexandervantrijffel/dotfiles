#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

export RUSTC_WRAPPER=sccache
export RUST_LOG=debug

FPATH=${FPATH}:$THISDIR/functions
autoload -z abr
autoload -z samabr

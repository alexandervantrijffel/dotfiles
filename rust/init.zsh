#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

export RUSTFLAGS="-L /usr/lib/aarch64-linux-gnu"
export RUSTC_WRAPPER=sccache
# export RUST_LOG=debug

FPATH=${FPATH}:$THISDIR/functions
autoload -z abr
autoload -z samabr

FPATH=${FPATH}:$THISDIR/functions
autoload -z ago
autoload -z ato
autoload -z atdr

# this can be removed
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -f /home/lex/.config/cargo/env ] && . "/home/lex/.config/cargo/env"

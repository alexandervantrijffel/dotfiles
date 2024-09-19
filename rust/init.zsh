#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

export RUSTFLAGS="-L /usr/lib/aarch64-linux-gnu"
# export RUSTC_WRAPPER=sccache
# export RUST_LOG=debug
#
export CARGO_TARGET_DIR=/tmp/target

export MYSQLCLIENT_LIB_DIR=/usr/lib/aarch64-linux-gnu/
export MYSQLCLIENT_VERSION=8.0.37

FPATH=${FPATH}:$THISDIR/functions

FPATH=${FPATH}:$THISDIR/functions
autoload -z ago
autoload -z ato

[ -d ~/.cargo/bin ] && export PATH="$PATH:$HOME/.cargo/bin"

# this can be removed
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -f /home/lex/.config/cargo/env ] && . "/home/lex/.config/cargo/env"

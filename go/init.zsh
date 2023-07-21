#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

zsh-defer znap source ohmyzsh/ohmyzsh plugins/golang

alias gomd="go mod download"
alias gomt="go mod tidy"

FPATH=${FPATH}:$THISDIR/functions
autoload -z ago
autoload -z ato

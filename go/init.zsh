#!/bin/zsh
THISDIR=${0:a:h}

zsh-defer znap source ohmyzsh/ohmyzsh plugins/golang

alias gomd="go mod download"
alias gomt="go mod tidy"

FPATH=${FPATH}:$THISDIR/functions
autoload -z ago
autoload -z ato

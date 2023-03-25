#!/bin/zsh

function z() {
   __zoxide_z "$@" && lsd -la
}

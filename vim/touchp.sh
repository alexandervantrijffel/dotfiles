#!/bin/sh
touchp() {
  mkdir -p "$(dirname "$1")" && touch "$1" && echo "$1"
}

touchpv() {
  mkdir -p "$(dirname "$1")" && touch "$1" && nvim "$1"
}

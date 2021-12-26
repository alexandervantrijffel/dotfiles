#!/bin/sh


touchp() {
  mkdir -p "$(dirname "$1")" && touch "$1" && echo "$1"
}

#!/bin/sh
mvt() {
  mv "$(dirname "$1")" /tmp
source $thisfolder/whatismyip.sh
}

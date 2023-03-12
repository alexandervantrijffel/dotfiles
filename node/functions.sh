#!/bin/zsh
yi() {
  if [ ! -f "$PWD/package.json" ]; then
    echo No package.json found in current folder. aborting...
    return 1
  fi

  yarn install
}

#!/bin/zsh

if ! zplug check; then
  printf "Run zplug install? [y/N]: "
  if read -q; then
      echo; zplug install
  else
      echo
  fi
fi

zplug load # --verbose


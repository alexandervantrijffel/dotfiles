#!/bin/zsh

echo home is $HOME >> /tmp/test.json

[ ! -L $HOME/.config/atuin/config.toml ] && {
  THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
  rm -f $HOME/.config/atuin/config.toml
  ln -s ${THISDIR}/config.toml $HOME/.config/atuin/config.toml
}

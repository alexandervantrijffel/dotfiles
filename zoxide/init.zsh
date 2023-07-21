# install zoxide with pacman

THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

type zoxide &>/dev/null && {
  zsh-defer eval "$(zoxide init zsh --cmd z --hook pwd)"
  zsh-defer source $THISDIR/functions/z.zsh

  alias zgha="z github.com/alexandervantrijffel"
  alias zgh="z github.com"
}

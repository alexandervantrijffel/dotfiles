# install zoxide with pacman

type zoxide &>/dev/null && {
  eval "$(zoxide init zsh --cmd z)"
  alias zgha="z github.com/alexandervantrijffel"
  alias zgh="z github.com"
}

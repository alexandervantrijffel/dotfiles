# install zoxide with pacman

type zoxide &>/dev/null && {
  eval "$(zoxide init zsh --cmd z)"
  alias cd="echo no more cd but zoxide (z)"

  alias zgha="z alexandervantrijffel"
  alias zgh="z dev/github.com"
}

# install zoxide with pacman

type zoxide &>/dev/null && {
  zsh-defer eval "$(zoxide init zsh --cmd z --hook pwd)"

  alias zgha="z github.com/alexandervantrijffel"
  alias zgh="z github.com"
}

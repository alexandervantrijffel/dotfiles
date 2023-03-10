if [[ -x $(command -v keychain) ]]; then
  # this is dependent on the pacman package `pinentry`
  zsh-defer eval `keychain --agents gpg 6DA187A7C48AE7C7 &> /dev/null`
  # eval `keychain  id_rsa --agents ssh &> /dev/null`
fi

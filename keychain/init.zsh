if [[ -x $(command -v keychain) ]]; then
  eval `keychain --agents gpg 6DA187A7C48AE7C7`
  eval `keychain --eval id_rsa --agents ssh`
fi

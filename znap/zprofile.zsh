#!/bin/zsh
[[ -d  /opt/fromgit/zsh-snap ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git /opt/fromgit/zsh-snap

if ! type yay >/dev/null 2>&1 && [ -f /opt/fromgit/yay/pkg/yay/usr/bin/yay ]; then
  sudo ln -s /opt/fromgit/yay/pkg/yay/usr/bin/yay /usr/local/bin/yay
fi

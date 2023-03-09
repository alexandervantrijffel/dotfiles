#!/bin/zsh
[[ -d  /opt/fromgit/zsh-snap ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git /opt/fromgit/zsh-snap

if [ -s /opt/fromgit/zsh-snap/znap.zsh ]; then
  source /opt/fromgit/zsh-snap/znap.zsh
  znap pull
fi

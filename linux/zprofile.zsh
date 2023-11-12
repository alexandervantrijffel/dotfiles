#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

[ ! -L /etc/security/limits.conf ] && {
  sudo rm /etc/security/limits.conf
  sudo ln -s ${THISDIR}/limits.conf /etc/security/limits.conf
  # also make sure to add `session required pam_limits.so` to `/etc/pam.d/*` files
}

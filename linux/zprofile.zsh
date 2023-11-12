#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

[ ! -L /etc/security/limits.conf ] && {
  sudo rm -f /etc/security/limits.conf
  sudo ln -s ${THISDIR}/limits.conf /etc/security/limits.conf
  # also make sure to add `session required pam_limits.so` to `/etc/pam.d/*` files
  #
  # check and set system wide file descriptor limit:
  # sysctl fs.file-max
  # sysctl -w fs.file-max=9223372036854775807
  #
}

[ -d /etc/systemd ] && [ ! -L /etc/systemd/system.conf.d/99-filelimit.conf ] && {
  sudo mkdir -p /etc/systemd/system.conf.d
  sudo rm -f /etc/systemd/system.conf.d/99-filelimit.conf
  sudo ln -s ${THISDIR}/99-services-filelimit.conf /etc/systemd/system.conf.d/
}

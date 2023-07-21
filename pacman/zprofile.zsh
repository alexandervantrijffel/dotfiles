[ ! -f $HOME/.config/no-packman-installed-packages-log ] && {
  THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

  pacman -Q > $THISDIR/installed-packages.log
}

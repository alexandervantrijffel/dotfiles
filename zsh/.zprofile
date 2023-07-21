#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# .zprofile: sourced in login shell
# symlink this file manually to ~/.zprofile

echo "Running ~/.zprofile"

if [ ! -L ~/.zshenv ]; then
    ln -s $THISDIR/.zshenv ~/
fi

. /etc/profile

if [ -z "$ZSH_VERSION" ]; then
    echo "Please use zsh"
    exit 1
fi

if [ ! -d "/opt/fromgit/zsh-defer" ]; then
    mkdir -p /opt/fromgit/
    git clone --depth 1 https://github.com/romkatv/zsh-defer.git /opt/fromgit/zsh-defer
fi

for f in $DOTFILES/**/zprofile.zsh; do
    . "$f"
done

if [[ ! $DISPLAY && $(tty) = /dev/tty1 ]]; then
    if ! xset q &>/dev/null; then
        exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
    fi
fi

#!/bin/zsh
if ! type fd 1>/dev/null; then
    if ! type fdfind; then sudo apt install fd-find; fi

    ! type fd 1>/dev/null &&  sudo ln -s $(which fdfind) /usr/bin/fd
    else
fi

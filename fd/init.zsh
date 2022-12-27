#!/bin/zsh
if ! type fd 1>/dev/null; then
    ! type fdfind && sudo apt install fd-find

    ! type fd 1>/dev/null && sudo ln -s $(which fdfind) /usr/bin/fd
fi

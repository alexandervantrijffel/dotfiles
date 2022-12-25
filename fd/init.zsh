#!/bin/zsh
if ! type fd 1>/dev/null; then
    if ! type fdfind; then sudo apt install fd-find; fi

    if ! type fdfind 1>/dev/null; then
      sudo ln -s $(which fdfind) /usr/bin/fd; fi
    else
fi

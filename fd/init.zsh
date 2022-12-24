#!/bin/zsh
if ! type fd 1>/dev/null; then
    if type fdfind 1>/dev/null; then sudo _ ln -s $(which fdfind) /usr/bin/fd; fi
fi

#!/bin/zsh
if ! type fd 1>/dev/null; then
    if type fdfind 1>/dev/null; then alias fd="fdfind"; fi
fi

#!/bin/zsh
export YARN_ENABLE_GLOBAL_CACHE=1
export YARN_CACHE_FOLDER=/usr/local/share/.cache/yarn/cache
export YARN_PNP_UNPLUGGED_FOLDER=/usr/local/share/.cache/yarn/unplugged


source ${0:a:h}/functions.sh

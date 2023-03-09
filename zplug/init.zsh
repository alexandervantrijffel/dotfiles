#!/bin/zsh

# if ! zplug check; then
#   printf "Run zplug install? [y/N]: "
#   if read -q; then
#       echo; zplug install
#   else
#       echo
#   fi
# fi

export ZPLUG_LOG_LOAD_SUCCESS=false
export ZPLUG_LOG_LOAD_FAILURE=false
zplug load # --verbose

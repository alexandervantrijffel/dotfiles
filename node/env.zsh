#!/bin/zsh

# if [ -s "/usr/share/nvm/init-nvm.sh" ]; then
#    . "/usr/share/nvm/init-nvm.sh"  # This loads nvm
# elif [ -s "$HOME/.nvm/init-nvm.sh" ]; then
# 	echo loading nvm2
#    . "$HOME/.nvm/init-nvm.sh"  # This loads nvm
# fi 
# 
# NVM_DIR="/usr/local/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export YARN_ENABLE_GLOBAL_CACHE=1
export YARN_CACHE_FOLDER=/usr/local/share/.cache/yarn/cache
export YARN_PNP_UNPLUGGED_FOLDER=/usr/local/share/.cache/yarn/unplugged

#!/bin/zsh
THISDIR=${0:a:h}

# NPM_TOKEN is set in ~/.zshrc.local
# export NPM_TOKEN=$(cat ~/.npmrc | sed 's/.*authToken=\(.*\)/\1/')

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ ! -f $HOME/.yarnrc ] && ln -s $THISDIR/.yarnrc.yml $HOME/.yarnrc

export YARN_CACHE_FOLDER=/usr/local/share/.config/yarn/global

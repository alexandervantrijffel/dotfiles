#!/bin/zsh

zplug "g-plane/zsh-yarn-autocompletions", hook-build:"./zplug.zsh", defer:2

# NPM_TOKEN is set in ~/.zshrc.local
# NPM_TOKEN=$(cat ~/.npmrc | sed 's/.*authToken=\(.*\)/\1/')

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias ya='yarn add -E'
alias yad='yarn add -E --dev'
alias yah='yarn audit --groups dependencies --level high'
alias yb='yarn build'
alias ybw='yarn build:watch'
alias ybs='yarn build:spec'
alias yd='yarn dev'
alias yga='yarn global add'
alias ygl='yarn global list'
alias ygr='yarn global remove'
alias yl='yarn link'
alias yr='yarn remove'
alias yse='yarn serve'
alias yst='yarn start'
alias ysw='yarn start:watch'
alias yt='yarn test'
alias ytuw='yarn test:unit:watch'
alias ytw='yarn test:watch'
alias ytc='yarn test:component'
alias yu='yarn unlink'
alias yo='yarn outdated'

. ${0:a:h}/functions.sh

#!/bin/zsh

# NPM_TOKEN is set in ~/.zshrc.local
# NPM_TOKEN=$(cat ~/.npmrc | sed 's/.*authToken=\(.*\)/\1/')

export NVM_COMPLETION=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')
export NVM_LAZY_LOAD=false
zsh-defer znap source "lukechilds/zsh-nvm"

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

. "${0:a:h}/functions.sh"

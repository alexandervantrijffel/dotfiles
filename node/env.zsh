#!/bin/zsh
alias ya='yarn add -E'
alias yad='yarn add -E --dev'
alias yah='yarn audit --groups dependencies --level high'
alias yb='yarn build'
alias ybw='yarn build:watch'
alias ybs='yarn build:spec'
alias yd='yarn deploy'
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

YARN_ENABLE_GLOBAL_CACHE=1
export YARN_CACHE_FOLDER=/usr/local/share/.cache/yarn/cache
export YARN_PNP_UNPLUGGED_FOLDER=/usr/local/share/.cache/yarn/unplugged


source ${0:a:h}/functions.sh

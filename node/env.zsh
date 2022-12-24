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

export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/home/lex/.fly/bin"


source ${0:a:h}/functions.sh

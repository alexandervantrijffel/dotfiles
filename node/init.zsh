#!/bin/zsh

zplug "g-plane/zsh-yarn-autocompletions", hook-build:"./zplug.zsh", defer:2

# NPM_TOKEN is set in ~/.zshrc.local
# NPM_TOKEN=$(cat ~/.npmrc | sed 's/.*authToken=\(.*\)/\1/')

if [ -s "/usr/share/nvm/init-nvm.sh" ]; then
   . "/usr/share/nvm/init-nvm.sh"  # This loads nvm
elif [ -s "/usr/local/nvm/nvm.sh" ]; then
   . "/usr/local/nvm/nvm.sh"  # This loads nvm
   . "/usr/local/nvm/bash_completion"  # This loads nvm
elif [ -s "$HOME/.nvm" ]; then
 [ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"  # This loads nvm
 [ -s "$HOME/.nvm/bash_completion" ] && \. "$HOME/.nvm/bash_completion"  # This loads nvm bash_completion
fi 

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

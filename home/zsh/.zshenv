export GOROOT="/usr/local/go"

export PATH="$PATH:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$GOROOT/bin"

if [ -d "/opt/node/bin" ]; then
  export PATH="$PATH:/opt/node/bin"
fi

export LC_ALL=en_US.UTF-8

export CGO_ENABLED=1

# aliases are here in .zshenv so that they are also available
# in the vim command line
if type ag 1>/dev/null; then
  alias ag='ag -p ~/.gitignore --hidden --all-types --ignore-case --one-device --pager "less -R" '
fi
if type batcat 1>/dev/null; then
  alias cat='batcat -p '
fi
if type pydf 1>/dev/null; then
  alias df="pydf"
fi
alias du="du -h --max-depth=1 "
alias fdh="fd --hidden --no-ignore "
if type htop 1>/dev/null; then
  alias top="sudo htop" # alias top and fix high sierra bug
fi
if type exa 1>/dev/null; then
  alias l="exa -alFbgh"
else
  alias l="ls -CFh"
fi
alias la="exa -albgh"
unalias ll
alias lps="lpass show -x -G "
alias md5sum=$'md5sum | awk -F \' \' \'{print $1}\' | tee /dev/tty | pbcopy'
alias open='xdg-open'
if ! type pbcopy 1>/dev/null; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi
alias python=python3
if type prettyping 1>/dev/null; then
  alias ping='prettyping'
fi
alias pass="date +%s | sha256sum | base64 | head -c 24 | tee /dev/tty | pbcopy"
alias psg="ps -a | grep $1"
alias pwd="pwd -L"
alias rm="rm -rf "
alias sudo="sudo -E "
alias _="sudo "
alias t="terminator --working-directory=\$(pwd)"
alias tl="tig log"
alias yrs="yarn run start &"


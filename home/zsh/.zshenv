export GOROOT="/usr/local/go"

export PATH="$PATH:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$GOROOT/bin"

if [ -d "/opt/node/bin" ]; then
  export PATH="$PATH:/opt/node/bin"
fi

if type nvim 1>/dev/null; then
  alias v="$(which nvim)"
else
  alias v="vi"
fi

export EDITOR=v
export VISUAL=v

export LC_ALL=en_US.UTF-8

# aliases are here in .zshenv so that they are also available
# in the vim command line
if type ag 1>/dev/null; then
alias ag='ag --hidden --all-types --ignore-case --one-device --pager "less -R" '
fi
if type batcat 1>/dev/null; then
  alias cat='batcat -p '
fi
alias d="docker "
if type pydf 1>/dev/null; then
  alias df="pydf"
fi
alias du="du -h --max-depth=1 "
alias dc="docker-compose "
alias fdh="fd --hidden --no-ignore "
if type feh 1>/dev/null; then
  # or use --zoom fill
  alias fehfg='nohup feh -zrs --scale-down --image-bg black --slideshow-delay 3600 ~/Pictures/bgsrcpics &'
fi
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
  alias preview="fzf --preview 'bat --color \"always\" {}'"
  # add support for ctrl+o to open selected file in VS Code
  export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules -g ""'
fi
alias fq="fzf -q "


if type htop 1>/dev/null; then
  alias top="sudo htop" # alias top and fix high sierra bug
fi
alias ka="k --namespace=argo "
if type exa 1>/dev/null; then
  alias l="exa -alFbgh"
else
  alias l="ls -CFh"
fi
alias la="exa -albgh"
alias lps="lpass show -x -G "
if ! type pbcopy 1>/dev/null; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi
if type prettyping 1>/dev/null; then
  alias ping='prettyping'
fi
alias psg="ps -a | grep $1"
alias rm="rm -rf "
alias sudo="sudo -E "
alias _="sudo "

alias t="terminator --working-directory=\$(pwd)"
alias tl="tig log"
alias yrs="yarn run start &"
alias pwd="pwd -L"

alias nvim="echo Be a bit concise please. And stay positive. Carpe diem! && return 1"

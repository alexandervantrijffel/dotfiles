export GOROOT="/usr/local/go"

export PATH="$PATH:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$GOROOT/bin"

if [ -d "/opt/node/bin" ]; then
  export PATH="$PATH:/opt/node/bin"
fi

if type nvim 1>/dev/null; then
  EDITOR=nvim
  VISUAL=nvim
else
  EDITOR=vi
  VISUAL=vi
fi

export LC_ALL=en_US.UTF-8
export LC_TIME=en_GB

# aliases are here in .zshenv so that they are also available
# in the vim command line
if type ag 1>/dev/null; then
alias ag='ag --hidden --all-types --ignore-case --one-device --pager "less -R" '
fi
if type batcat 1>/dev/null; then
  alias cat='batcat -p '
fi
alias d="docker "
alias df="pydf"
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

alias t="terminator --working-directory=$(pwd)"
alias tl="tig log"
alias ts="tig status"
alias yrs="yarn run start &"
alias pwd="pwd -L"

# https://github.com/scmbreeze/scm_breeze
# [ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

alias gaa="git add --all ."
alias gap="git add . -p && git status"
alias gba="git branch -a "
alias gc="git checkout "
alias gc-="git checkout -"
alias gca="git commit --amend --no-edit "
alias gcb="git checkout -b "
alias gcp="git cherry-pick "
alias gcm="git commit -m  "
alias gclean="git checkout -- . && git clean -fd ."
alias gd="git diff --word-diff -w "
alias gds="gd --staged --word-diff | git apply --cached --ignore-whitespace --ignore-space-change --unidiff-zero -"
alias gds="git diff --staged --word-diff -w"
alias gl="git log --max-count=500 --stat --decorate --graph --color --pretty=format:'%C(yellow)%h %C(cyan)%ad %Cgreen%d %Creset%s %C(yellow)%an' --date=short"
alias gls="git log --max-count=500 --decorate --graph --color --pretty=format:'%C(yellow)%h %C(cyan)%ad %Cgreen%d %Creset%s %C(yellow)%an' --date=short"
alias glp="git log -p "
alias gma="git merge --abort "
alias gmc="git merge --continue "
alias gmnc="git merge --no-commit --no-ff "
alias gfa="git fetch --all"
alias gp="git push"
alias gpu="git push -u origin \$(git branch | grep \* | cut -d ' ' -f2)"
alias gpf='echo no gpf please'
alias gp!="git push --force"
alias gpff="git pull --ff-only"
alias gra="git rebase --abort "
alias grm="git rebase master "
alias grc="git rebase --continue "
alias gss="git stash save "
alias gsa="git stash apply "
alias gsw="git show "

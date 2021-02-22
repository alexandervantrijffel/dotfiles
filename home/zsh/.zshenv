if [ ! -f ~/.zshrc.local ]; then
  echo "!!! please add ~/.zshrc.local and set $DOTFILES !!!\n\n"
fi

# sets $DOTFILES
source ~/.zshrc.local

if [ -d "/opt/node/bin" ]; then
  export PATH="$PATH:/opt/node/bin"
fi

export LC_ALL=en_US.UTF-8

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





alias gaa="git add --all ."
alias gb="git branch | grep \* | cut -d ' ' -f2"
alias gba="git branch -a "
alias gc-="git checkout -"
alias gca="git commit --amend --no-edit "
alias gcb="git checkout -b "
alias gcom="gco master && gpff && gs"
alias gcp="git cherry-pick "
alias gcm="git commit -v -m  "
alias gclean="git checkout -- . && git clean -fd ."
alias gd="git diff --word-diff -w "
alias gds="gd --staged --word-diff | git apply --cached --ignore-whitespace --ignore-space-change --unidiff-zero -"
alias gds="git diff --staged --word-diff -w"
alias gl="git log --max-count=500 --stat --decorate --graph --color --pretty=format:'%C(yellow)%h %C(cyan)%ad %Cgreen%d %Creset%s %C(yellow)%an' --date=short"
alias gls="git log --max-count=500 --decorate --graph --color --pretty=format:'%C(yellow)%h %C(cyan)%ad %Cgreen%d %Creset%s %C(yellow)%an' --date=short"
alias glp="git log -p "
alias gma="git merge --abort "
alias gmc="git merge --continue "
alias gmm="git merge master "
alias gmnc="git merge --no-commit --no-ff "
alias gfa="git fetch --all"
alias gp="git push"
alias gpu="git push -u origin \$(gb)"
alias gpf='echo no gpf please'
alias gp!="git push --force"
alias gpff="git pull --ff-only"
alias gra="git rebase --abort "
alias grm="git rebase master "
alias grc="git rebase --continue "
alias gs="git fetch origin \$(gb) && git status"
alias gap="git add . -p && gs"
alias gss="git stash save "
alias gsa="git stash apply "
alias gsw="git show "
alias ts="git fetch origin \$(gb) && tig status"


for f in $DOTFILES/home/**/env.zsh; do 
  source "$f"
done


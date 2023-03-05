[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

source $DOTFILES/zplug/preinit.zsh

if type prettyping 1>/dev/null; then
  alias ping='prettyping'
fi

for f in $DOTFILES/**/init.zsh; do 
  source "$f"
done

if ! zplug check; then
  printf "Run zplug install? [y/N]: "
  if read -q; then
      echo; zplug install
  else
      echo
  fi
fi


zplug load # --verbose

for f in $DOTFILES/**/postinit.zsh; do 
  source "$f"
done

alias .d="cd $DOTFILES"
alias .v="cd $DOTFILES && v"

if type batcat 1>/dev/null; then
  alias cat='batcat -p '
fi
if type bat 1>/dev/null; then
  alias cat='bat -p '
fi
if type htop 1>/dev/null; then
  alias top="sudo htop" # alias top and fix high sierra bug
fi
alias lps="lpass show -x -G "
alias md5sum=$'md5sum | awk -F \' \' \'{print $1}\' | tee /dev/tty | pbcopy'
alias open='xdg-open'
if ! type pbcopy 1>/dev/null; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi
alias pass="date +%s | sha256sum | base64 | head -c 24 | tee /dev/tty | pbcopy"
alias psg="ps -a | grep $1"
alias pwd="pwd -L"
alias rm="rm -rf "
alias sudo="sudo -E "
alias _="sudo "


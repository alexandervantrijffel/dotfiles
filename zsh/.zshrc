if ! [ -f $HOME/.zshenv ];then 
  echo Installing ~/.zshenv
  DOTFILES=$(readlink -e "$HOME/.zshrc" | xargs dirname | xargs dirname)
  ln -s $DOTFILES/zsh/.zshenv $HOME/
  source $HOME/.zshenv
fi

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

source $DOTFILES/zplug/preinit.zsh

rm -f ~/.zcompdump*

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

# have to place here at the end because grep is aliassed by ohmyzsh
alias grep="grep -i --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}"

# cd into working directory
cwd

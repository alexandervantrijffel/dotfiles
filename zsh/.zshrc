if ! [ -f $HOME/.zshenv ];then 
  echo Installing ~/.zshenv
  DOTFILES=$(readlink -e "$HOME/.zshrc" | xargs dirname | xargs dirname)
  ln -s $DOTFILES/zsh/.zshenv $HOME/
  source $HOME/.zshenv
fi

export GDK_SCALE=0.5
export GDK_DPI_SCALE=2

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

source $DOTFILES/zplug/preinit.zsh

# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

setopt MENU_COMPLETE  # select first menu option automatically
setopt NO_NOMATCH  # stop zsh from catching ^ chars.
setopt PROMPT_SUBST  # prompt substitution
setopt AUTO_CONTINUE


# # fix rider showing on Wayland
# export _JAVA_AWT_WM_NONREPARENTING=1

rm -f ~/.zcompdump*

# for clipboard sharing with host
if type vmware-user 1>/dev/null; then
  vmware-user --no-startup-d
fi

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
  source "$f" &
done

# have to place here at the end because grep is aliassed by ohmyzsh
alias grep="grep -iF --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}"

if type duf 1>/dev/null; then
  alias df="duf"
else
  sudo apt install duf
fi

# cd into working directory
cwd

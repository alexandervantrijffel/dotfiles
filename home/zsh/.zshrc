# install zplug if required
! [[ -d $HOME/.zplug ]] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

source ~/.zplug/init.zsh

zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
# zplug "b4b4r07/enhancd", , use:init.sh
# show aliases hints if abbrevations are available for typed commands
zplug "denilsonsa/prettyping", as:command, use:"prettyping", defer:3
zplug "djui/alias-tips", defer:3
zplug "g-plane/zsh-yarn-autocompletions"
#zplug "ndbroadbent/scm_breeze", hook-build:"$ZPLUG_HOME/repos/ndbroadbent/scm_breeze/install.sh"
# alternative for exa, doesn't work
# zplug "Peltoche/lsd", as:command
zplug "plugins/cp", from:oh-my-zsh
zplug "plugins/httpie", from:oh-my-zsh, defer:3
zplug "plugins/rsync", from:oh-my-zsh, defer:3
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh, defer:2
zplug "bonnefoa/kubectl-fzf", defer:3
zplug "plugins/zsh_reload", from:oh-my-zsh, defer:3
# zplug "raylee/tldr", as:command, use:"tldr"
# zplug "sharkdp/bat", as:command, from:gh-r, rename-to:bat
zplug "stedolan/jq", as:command, from:gh-r, defer:3
zplug "sharkdp/fd", as:command, from:gh-r, rename-to:fd, defer:3
zplug "so-fancy/diff-so-fancy", as:command, defer:3
zplug "zsh-users/zsh-autosuggestions", defer:3

# make sure the autosuggestions color differs from the solarized dark background color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

# execute auto suggestion with CTRL E
bindkey "^E" autosuggest-execute

bindkey "^F" forward-word

zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "zsh-users/zsh-completions", use:src, defer:3
zplug "jeffreytse/zsh-vi-mode", defer:3
# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "pjvds/zsh-cwd"

stty start undef  # disable C-s stopping receiving keyboard signals.
stty stop undef
setopt MENU_COMPLETE  # select first menu option automatically
setopt NO_NOMATCH  # stop zsh from catching ^ chars.
setopt PROMPT_SUBST  # prompt substitution
setopt AUTO_CONTINUE

# caps lock = control key
# re-run this when plugging in another keyboard
type setxkbmap && setxkbmap -option ctrl:nocaps

# fix rider showing on Wayland
export _JAVA_AWT_WM_NONREPARENTING=1

set clipboard=unnamedplus



# after entering repeat command like !-2, press space to auto-expand the command
bindkey ' ' magic-space

bindkey '^l' history-search-backward
bindkey '^k' history-search-forward

export HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"


# my life is complete now

# for jeffreytse/zsh-vi-mode
export ZVM_VI_ESCAPE_BINDKEY=jj

# for softmoth/zsh-vim-mode
# bindkey 'jj' vi-cmd-mode

# life is even completer now
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^q' exit_zsh

bindkey -M vicmd '^v' edit-command-line

# for clipboard sharing with host
if type vmware-user 1>/dev/null; then
  vmware-user --no-startup-d
fi

if [ -f ~/.zshrc.local ]; then
  # sets $DOTFILES
  source ~/.zshrc.local
fi

for f in $DOTFILES/home/**/init.zsh; do 
  source "$f"
done

alias .="cd $DOTFILES"
alias .v="cd $DOTFILES && v"

if ! zplug check; then
  printf "Run zplug install? [y/N]: "
  if read -q; then
      echo; zplug install
  else
      echo
  fi
fi
zplug load # --verbose

if type fortune 1>/dev/null; then
  fortune | cowsay -f meow | xargs -0 echo -e "     $(date "+ %A %e %B %R Week %V")\n" 
fi

# Press ^v in normal mode for editing the command line in the default editor
autoload edit-command-line; zle -N edit-command-line

for f in $DOTFILES/home/**/postinit.zsh; do 
  source "$f"
done

unalias ll

# cd into working directory
cwd

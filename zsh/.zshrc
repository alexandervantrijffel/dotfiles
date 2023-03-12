#!/bin/zsh

# .zshrc : only sourced for interactive shells

source /opt/fromgit/zsh-defer/zsh-defer.plugin.zsh


# support for compdef (completions for zsh)
export ZSH_DISABLE_COMPFIX="true"
autoload -Uz compinit
compinit -d $HOME/.cache/.zcompdump-$HOST
compinit -u

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/home/lex/.zshrc'

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

for f in $DOTFILES/**/preinit.zsh; do 
  . "$f"
done

if type prettyping 1>/dev/null; then
  alias ping='prettyping'
fi

for f in $DOTFILES/**/init.zsh; do 
  . "$f"
done

for f in $DOTFILES/**/postinit.zsh; do 
  . "$f"
done

alias .d="z $DOTFILES"
alias .v="z $DOTFILES && v"

if type batcat 1>/dev/null; then
  alias cat='batcat -p '
elif type bat 1>/dev/null; then
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

# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# make sure the autosuggestions color differs from the solarized dark background color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
setopt MENU_COMPLETE  # select first menu option automatically
setopt NO_NOMATCH  # stop zsh from catching ^ chars.
setopt PROMPT_SUBST  # prompt substitution
setopt AUTO_CONTINUE

if [ -s /opt/fromgit/zsh-snap/znap.zsh ]; then
    # show aliases hints if abbrevations are available for typed commands
  znap source djui/alias-tips
  znap source zsh-users/zsh-autosuggestions
  znap source zsh-users/zsh-completions
  znap eval trapd00r/LS_COLORS "$( whence -a dircolors gdircolors ) -b LS_COLORS"
  znap install denilsonsa/prettyping
  znap install so-fancy/diff-so-fancy
  if [[ $(lsb_release -a 2>/dev/null) =~ "Arch" ]]; then 
    znap source zsh-users/zsh-history-substring-search
    znap source zsh-users/zsh-syntax-highlighting
  fi
  znap source zdharma-continuum/fast-syntax-highlighting
  znap source pjvds/zsh-cwd
  # this plugin is conflicting with aloxaf/fzf-tab
  # znap source bonnefoa/kubectl-fzf shell/kubectl_fzf.plugin.zsh
fi 

# after entering repeat command like !-2, press space to auto-expand the command
bindkey ' ' magic-space

# execute auto suggestion with CTRL E
bindkey "^E" autosuggest-execute
bindkey "^F" forward-word

# finish profiling (started in .zshenv)
# zprof > /tmp/zprof.dump


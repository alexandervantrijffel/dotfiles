#!/bin/zsh

# .zshrc : only sourced for interactive shells

source /opt/fromgit/zsh-defer/zsh-defer.plugin.zsh

# support for compdef (completions for zsh)
export ZSH_DISABLE_COMPFIX="true"
autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/.zcompdump-$HOST
compinit -u

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

for f in $DOTFILES/**/preinit.zsh; do
    . "$f"
done

type prettyping 1>/dev/null && alias ping='prettyping'

for f in $DOTFILES/**/init.zsh; do
    . "$f"
done

for f in $DOTFILES/**/postinit.zsh; do
    . "$f"
done

if type batcat 1>/dev/null; then
    alias cat='batcat -p '
elif type bat 1>/dev/null; then
    alias cat='bat -p '
fi
! type htop 1>/dev/null && alias top="sudo htop" # alias top and fix high sierra bug
alias lps="lpass show -x -G "
alias md5sum=$'md5sum | awk -F \' \' \'{print $1}\' | tee /dev/tty | pbcopy'
alias open='xdg-open'
! type pbcopy 1>/dev/null && {
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
}

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

setopt MENU_COMPLETE  # select first menu option automatically
setopt NO_NOMATCH  # stop zsh from catching ^ chars.
setopt PROMPT_SUBST  # prompt substitution
setopt AUTO_CONTINUE

if [ -s /opt/fromgit/zsh-snap/znap.zsh ]; then
    # show aliases hints if abbrevations are available for typed commands
    znap source djui/alias-tips
    # completions crash because of this one:
    zsh-defer znap source zsh-users/zsh-autosuggestions
    zsh-defer znap source zsh-users/zsh-completions

    # try this one
    # zsh-defer znap source zsh-users/zsh-autocomplete
    znap eval trapd00r/LS_COLORS "$( whence -a dircolors gdircolors ) -b LS_COLORS"
    ! type prettyping &>/dev/null && znap install denilsonsa/prettyping
    if [[ $(lsb_release -a 2>/dev/null) =~ "Arch" ]]; then
        znap source zsh-users/zsh-history-substring-search
        zsh-defer znap source zsh-users/zsh-syntax-highlighting
    fi
    zsh-defer znap source zdharma-continuum/fast-syntax-highlighting
    local mods=({cp,docker,docker-compose,rsync,ssh-agent,kubectl,kubectx})
    zsh-defer znap source ohmyzsh/ohmyzsh plugins/$^mods

    # make sure the autosuggestions color differs from the solarized dark background color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

    zsh-defer znap source pjvds/zsh-cwd
fi

[ -f $HOME/.config/zsh/.zshrc.local ] && source $HOME/.config/zsh/.zshrc.local


znap source "softmoth/zsh-vim-mode"

# after entering repeat command like !-2, press space to auto-expand the command
bindkey ' ' magic-space


# Press C-v in insert mode or normal/command mode for editing the command line in the default editor
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
bindkey -M vicmd '^v' edit-command-line
bindkey -M viins '^v' edit-command-line

# exit with C-q
exit_zsh() { exit }
autoload exit_zsh; zle -N exit_zsh
bindkey '^q' exit_zsh
# repeat last command
bindkey -s '^l' '!!^M^M'
# vi editing mode
bindkey -v 

bindkey -M vicmd '^q' exit_zsh
bindkey -M viins '^q' exit_zsh

# finish profiling (started in .zshenv)
# zprof > /tmp/zprof.dump
# zprof | head -n 15

# execute auto suggestion with CTRL E
bindkey "^E" autosuggest-execute
bindkey "^F" forward-word
# for softmoth/zsh-vim-mode
bindkey 'jj' vi-cmd-mode

bindkey '^P' up-history

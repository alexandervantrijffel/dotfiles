# install zplug if required
! [[ -d $HOME/.zplug ]] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

source ~/.zplug/init.zsh

zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh", nice:-1
# zplug "b4b4r07/enhancd", , use:init.sh
# show aliases hints if abbrevations are available for typed commands
zplug "denilsonsa/prettyping", as:command, use:"prettyping", defer:3
zplug "djui/alias-tips", defer:3
zplug "g-plane/zsh-yarn-autocompletions"
zplug "junegunn/fzf", as:command, hook-build:"./install --bin", use:"bin/{fzf-tmux,fzf}"
#zplug "ndbroadbent/scm_breeze", hook-build:"$ZPLUG_HOME/repos/ndbroadbent/scm_breeze/install.sh"
# alternative for exa, doesn't work
# zplug "Peltoche/lsd", as:command
zplug "plugins/cp", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh, defer:3
zplug "plugins/docker-compose", from:oh-my-zsh, defer:3
zplug "plugins/git", from:oh-my-zsh, nice:10
zplug "plugins/golang", from:oh-my-zsh, nice:10, defer:3
zplug "plugins/httpie", from:oh-my-zsh, defer:3
zplug "plugins/rsync", from:oh-my-zsh, defer:3
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh, defer:2
zplug "bonnefoa/kubectl-fzf", defer:3
zplug "plugins/zsh_reload", from:oh-my-zsh, defer:3
zplug "romkatv/powerlevel10k", as:theme, depth:1
# zplug "raylee/tldr", as:command, use:"tldr"
zplug "rupa/z", use:z.sh
# export _Z_DATA=$ZPLUG_REPOS/rupa/z/data
# zplug "sharkdp/bat", as:command, from:gh-r, rename-to:bat
zplug "softmoth/zsh-vim-mode", defer:3
zplug "stedolan/jq", as:command, from:gh-r, defer: 3
zplug "sharkdp/fd", as:command, from:gh-r, rename-to:fd, defer: 3
zplug "so-fancy/diff-so-fancy", as:command, defer: 3
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions", use:src
# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search", nice:10

if ! zplug check; then
  printf "Install? [y/N]: "
  if read -q; then
      echo; zplug install
  else
      echo
  fi
fi
zplug load # --verbose

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

stty start undef  # disable C-s stopping receiving keyboard signals.
stty stop undef
setopt MENU_COMPLETE  # select first menu option automatically
setopt NO_NOMATCH  # stop zsh from catching ^ chars.
setopt PROMPT_SUBST  # prompt substitution
setopt AUTO_CONTINUE


set -o vi

# execute auto suggestion with CTRL E
bindkey "^E" autosuggest-execute

bindkey "^F" forward-word

# make sure the autosuggestions color differs from the solarized dark background color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'


if [ "$(uname)" = "Darwin" ]; then
  VSCODE='/Applications/Visual Studio Code.app/Contents/Resources/app/bin'
  if [ -d "$VSCODE" ]; then
    export PATH="$PATH:$VSCODE"
  fi

  bindkey -v
else
  if type feh 1>/dev/null; then
    feh --slideshow-delay 1800 --bg-tile $HOME/Pictures/backgrounds -z -r -D1800
    # // --bg-fill or --bg-scale?
  fi
  alias open='xdg-open'
  alias python=python3
  
  . z

  # caps lock = control key
  # re-run this when plugging in another keyboard
  setxkbmap -option ctrl:nocaps

  # fix rider showing on Wayland
  export _JAVA_AWT_WM_NONREPARENTING=1
 
  # fix for qutebrowser
  export QT_AUTO_SCREEN_SCALE_FACTOR=1

  if [ -f /usr/local/bin/scale125 ]; then 
    /usr/local/bin/scale125
  fi
fi

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

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# my life is complete now
bindkey 'jj' vi-cmd-mode

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"
# for clipboard sharing with host
if type vmware-user 1>/dev/null; then
  vmware-user --no-startup-d
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

(( ! ${+functions[p10k]} )) || p10k finalize

# fzf
source ~/.zplug/repos/junegunn/fzf/shell/key-bindings.zsh
source ~/.zplug/repos/junegunn/fzf/shell/completion.zsh

alias ag='ag -p ~/.gitignore --hidden '
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias .="cd $DOTFILES"
alias .v="cd $DOTFILES && nvim"

alias be.="z ps-737migration-be"
alias be.v="z ps-737migration-be && nvim"
alias be.w="z ps-737migration-be && cd workspace"

alias fe.="z ps-licenseadmin-fe"
alias fe.v="z ps-licenseadmin-fe && nvim"

# https://github.com/scmbreeze/scm_breeze
# [ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

alias gaa="git add --all ."
alias gap="git add . -p && git status"
alias gba="git branch -a "
alias gc="git checkout \"\$(git branch --all | fzf| tr -d '[:space:]')\""
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

unalias ll

if type fortune 1>/dev/null; then
  fortune | cowsay -f meow | xargs -0 echo -e "     $(date "+ %A %e %B %R Week %V")\n" 
fi

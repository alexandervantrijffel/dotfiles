# If you come from bash you might have to change your $PATH.


# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
  # autojump

plugins=(
  git 
  extract
  ssh-agent
  vi-mode
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  kubectl
  colorize
  z
  shrink-path
)

source $ZSH/oh-my-zsh.sh

set -o vi

# execute auto suggestion with CTRL right arrow
bindkey "^[[1;5C" autosuggest-execute

# make sure the autosuggestions color differs from the solarized dark background color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

# export LANG=en_US.UTF-8

if type nvim 1>/dev/null; then
  EDITOR=nvim
  VISUAL=nvim
else
  EDITOR=vim
  VISUAL=vim
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

alias du="du -max-depth=1"
alias dc="docker-compose "
alias gc="git checkout "
alias gc-="git checkout -"
alias grep="grep -i"
alias gs="git show"
alias tl="tig log"
alias gcb="git checkout -b "
alias gfa="git fetch --all"
alias gp="git push"
alias gpu="git push -u origin \$(git branch | grep \* | cut -d ' ' -f2)"
alias gpf='echo no gpf please'
alias gpforce="git push --force"
alias gpff="git pull --ff-only"
alias gl="git log --max-count=10 --decorate --graph --color --pretty=format:'%C(yellow)%h %C(cyan)%ad %Cgreen%d %Creset%s %C(yellow)%an' --date=short"
alias gcm="git commit -m  "
alias gd="git diff --word-diff -w"
alias gds="gd --staged"
alias gds="git diff --staged --word-diff -w"
alias ga="git add . -p && git add ."
alias gba="git branch -a"
alias grd="go run -tags=debug main.go | lnav -q"
alias ll="exa -alFbgh"
alias la="exa -albgh"
alias l="ls -CFh"
alias kc="kubectl"
alias psg="ps -a | grep $1"
alias tl="tig log"
alias ts="tig status"
alias yrs="yarn run start"


if type yarn 1>/dev/null; then
	# set PATH so it includes user's private bin directories and go directories
	PATH="$PATH:$HOME/bin:$HOME/.local/bin:/usr/localbin:$(yarn global bin)"
fi

if [ "$(uname)" = "Darwin" ]; then
  VSCODE='/Applications/Visual Studio Code.app/Contents/Resources/app/bin'
  if [ -d "$VSCODE" ]; then
    export PATH="$PATH:$VSCODE"
  fi

  bindkey -v
  bindkey '^a' beginning-of-line
  bindkey '^b' backward-char
  bindkey '^e' end-of-line
  bindkey '^f' forward-char
  bindkey '^h' backward-delete-char
  bindkey '^k' kill-line
  bindkey '^u' kill-whole-line
  bindkey '^w' backward-kill-word
else
  feh --bg-fill /data/images/backgrounds -z -r -D1800
  alias open='xdg-open'
  
  . z

  # caps lock = control key
  # re-run this when plugging in another keyboard
  setxkbmap -option ctrl:nocaps
fi

# customize prompt
DEFAULT_USER=$USER

prompt_dir() {
 prompt_segment blue white $(shrink_path -f -s)
}

set clipboard=unnamedplus

[ -d "/etc/zsh" ] &&  source /etc/zsh/zprofile

# after entering repeat command like !-2, press space to auto-expand the command
bindkey ' ' magic-space

if type bat 1>/dev/null; then
  alias cat='bat'
fi

if type prettyping 1>/dev/null; then
  alias ping='prettyping'
fi

if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
  alias preview="fzf --preview 'bat --color \"always\" {}'"
  # add support for ctrl+o to open selected file in VS Code
  export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules -g ""'
fi

if type ag 1>/dev/null; then
  alias ag='ag --pager "less -R"'
fi

if type htop 1>/dev/null; then
  alias top="sudo htop" # alias top and fix high sierra bug
fi

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

if type fortune 1>/dev/null; then
  fortune | cowsay -f meow | lolcat
fi

if ! type pbcopy 1>/dev/null; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

export LC_ALL=en_US.UTF-8

# my life is complete now
bindkey 'jj' vi-cmd-mode



# ubuntu terminal window blue background color #0F293C

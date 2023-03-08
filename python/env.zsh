PATH="$PATH:$HOME/.poetry/bin"

if [ -f $HOME/.pyenv/bin/pyenv ]; then
  # shims must be the first in PATH for this to work...
  export PATH="$HOME/.pyenv/shims:$PATH:$HOME/.pyenv/bin"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

PATH="$PATH:$HOME/.poetry/bin"

if [ -f $HOME/.pyenv/bin/pyenv ]; then
  # shims must be the first in PATH for this to work...
  export PATH="$HOME/.pyenv/shims:$PATH:$HOME/.pyenv/bin"

  znap function _pyenv pyenv              'eval "$( pyenv init - --no-rehash || pyenv virtualenv-init - )"'
  compctl -K    _pyenv pyenv
fi

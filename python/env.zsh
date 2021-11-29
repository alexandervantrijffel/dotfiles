export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$HOME/.poetry/bin:$HOME/.pyenv/bin"

if type pyenv 1>/dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

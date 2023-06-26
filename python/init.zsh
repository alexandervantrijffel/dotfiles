if type pyenv 1>/dev/null; then
  eval "$(pyenv init -)"
else 
  echo "pyenv not found"
fi

export WORKON_HOME=$HOME/.config/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

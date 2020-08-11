export GOROOT="/usr/local/go"

export PATH="$PATH:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$GOROOT/bin"

if [ -d "/opt/node/bin" ]; then
  export PATH="$PATH:/opt/node/bin"
fi



if type nvim 1>/dev/null; then
  EDITOR=nvim
  VISUAL=nvim
else
  EDITOR=vi
  VISUAL=vi
fi


export GOPATH="$HOME/go"
if [ -d /usr/lib/go ]; then
  # default install location for pacman go
  export GOROOT="/usr/lib/go"
else
  export GOROOT="/usr/local/go"
fi

export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
export CGO_ENABLED=1

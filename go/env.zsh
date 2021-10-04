export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
export CGO_ENABLED=1

alias gomd="go mod download"
alias gomt="go mod tidy"

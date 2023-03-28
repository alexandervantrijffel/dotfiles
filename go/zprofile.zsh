#/bin/zsh

if ! type golines 1>/dev/null; then
  if type go 1>/dev/null; then
    go install github.com/segmentio/golines@latest
  fi
fi

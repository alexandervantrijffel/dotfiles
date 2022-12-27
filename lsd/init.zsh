if ! type lsd 1>/dev/null; then
  type cargo 1>/dev/null && cargo install lsd
fi

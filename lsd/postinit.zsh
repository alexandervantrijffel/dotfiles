unalias ll 2>/dev/null || true
unalias l  2>/dev/null || true
if type lsd 1>/dev/null; then
  alias l="lsd -la"
else 
  if type exa 1>/dev/null; then
    alias la="exa -albgh"
    alias l="exa -alFbgh"
  else
    alias l="ls -laFh --color=auto"
  fi
fi

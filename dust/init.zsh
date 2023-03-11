if type ncdu 1>/dev/null; then
    alias du="ncdu"
elif dust 1>/dev/null; then 
  alias du="dust"
else
    alias du="du -h --max-depth=1"
fi

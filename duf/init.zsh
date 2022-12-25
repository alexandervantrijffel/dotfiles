if type duf 1>/dev/null; then
    alias df="duf"
  else
      sudo apt install duf
fi

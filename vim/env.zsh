if type nvim 1>/dev/null; then
  export EDITOR=nvim
  export VISUAL=nvim
  export COLORTERM="truecolor"
else
  export EDITOR=vi
  export VISUAL=vi
fi

if type nvim 1>/dev/null; then
  EDITOR=nvim
  VISUAL=nvim
  COLORTERM="truecolor"
else
  EDITOR=vi
  VISUAL=vi
fi

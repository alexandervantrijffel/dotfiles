if type nvim 1>/dev/null; then
  alias v="$(which nvim)"
  EDITOR=nvim
  VISUAL=nvim
  COLORTERM="truecolor"
else
  alias v="vi"
  EDITOR=vi
  VISUAL=vi
fi

if type nvim 1>/dev/null; then
  alias v="$(which nvim)"
  export EDITOR=nvim
  export VISUAL=nvim
  export COLORTERM="truecolor"
else
  alias v="vi"
  export EDITOR=vi
  export VISUAL=vi
fi

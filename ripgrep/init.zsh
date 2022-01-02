#!/bin/zsh
zplug 'BurntSushi/ripgrep', from:gh-r, as:command, rename-to:"rg"

rgp() {
  echo args is "$@"
  local count=$(rg "$@" | wc -l)
  
  if (( $count < 40 )); then 
    echo count $count is below 40
    rg "$@"
  else 
    echo count $count is 40 or above
    echo todo paging and color output
    rg "$@"
  fi
}

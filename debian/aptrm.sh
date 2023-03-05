#!/bin/zsh
function aptrm {
  toremove=$(apt list --installed | fzf)
  echo got arguments "$@"
  if [ -n "$toremove" ]; then
    noreleaseinfo=$(echo "$toremove" | sed "s/,.*//" )
    echo Removing $noreleaseinfo
    sudo apt remove "$noreleaseinfo" "$@"
    sudo apt autoremove "$@"
  fi
}

unalias gco 2> /dev/null
function gco {
  local selectedbranch
  selectedbranch=$(git branch -a | fzf)
  nospaces="$(echo -e "$selectedbranch" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  if [ -n "$nospaces" ]; then 
    noremotes=$(echo "$nospaces" | sed "s/remotes\///gI")
    echo "checkout branch $noremotes"
    git checkout $noremotes
  fi
}

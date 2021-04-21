unalias gco 2> /dev/null
function gco {
  local branches=$(git branch -a)
  # if arg 1 is provided and it is a branch
  [[ $1 = *[![:space:]]* ]] && if [[ $branches =~ $1 ]];then
    echo "checkout branch $1"
    git checkout $1
    return $?
  fi

  if ! type fzf 1>/dev/null; then
    echo "fzf is required"
    exit 127
  fi

  local selectedbranch=$(git branch -a | fzf)
  local nospaces="$(echo -e "$selectedbranch" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  if [ -n "$nospaces" ]; then 
    local filtered=$(echo "$nospaces" | sed "s/remotes\///gI")
    # remove current branch flag '* '
    filtered=$(echo $filtered | sed "s/^\* //")
    echo "checkout branch $filtered"
    git checkout $filtered "$@"
  fi
}

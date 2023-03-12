if [ -s /opt/fromgit/zsh-snap/znap.zsh ]; then
  . /opt/fromgit/zsh-snap/znap.zsh
    # show aliases hints if abbrevations are available for typed commands
  znap source djui/alias-tips
  znap source ohmyzsh/ohmyzsh lib/{clipboard,compfix,directories,functions,grep,history,key-bindings,misc,nvm}.zsh
  local mods=({cp,docker,docker-compose,rsync,ssh-agent,kubectl,kubectx})
  znap source ohmyzsh/ohmyzsh plugins/$^mods
  znap source zsh-users/zsh-autosuggestions
  znap source zsh-users/zsh-completions
  znap source pjvds/zsh-cwd
  znap eval trapd00r/LS_COLORS "$( whence -a dircolors gdircolors ) -b LS_COLORS"
  znap install denilsonsa/prettyping
  znap install so-fancy/diff-so-fancy
  if [[ $(lsb_release -a 2>/dev/null) =~ "Arch" ]]; then 
    znap source zsh-users/zsh-history-substring-search
    znap source zsh-users/zsh-syntax-highlighting
  fi
fi 

# Usage:
# git diff --color | diff-so-fancy         # Use d-s-f on one diff
# cat diff.txt | diff-so-fancy             # Use d-s-f on a diff/patch file
# diff -u one.txt two.txt | diff-so-fancy  # Use d-s-f on unified diff output

# diff-so-fancy --colors                   # View the commands to set the recommended colors
# diff-so-fancy --set-defaults             # Configure git-diff to use diff-so-fancy and suggested colors


# these plugins are conflicting with aloxaf/fzf-tab
# znap source marlonrichert/zsh-autocomplete
# znap source zdharma-continuum/fast-syntax-highlighting
# znap source onnefoa/kubectl-fzf shell/

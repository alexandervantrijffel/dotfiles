

. /opt/fromgit/zsh-snap/znap.zsh
  # show aliases hints if abbrevations are available for typed commands
znap source djui/alias-tips
ENABLE_CORRECTION=true
znap source ohmyzsh/ohmyzsh lib/{clipboard,compfix,completion,correction,directories,functions,grep,history,key-bindings,misc,nvm}.zsh
znap eval trapd00r/LS_COLORS "$( whence -a dircolors gdircolors ) -b LS_COLORS"
znap source ohmyzsh/ohmyzsh plugins/{cp,rsync,ssh-agent,kubectl,kubectx}

if [[ $(lsb_release -a 2>/dev/null) =~ "Ubuntu" ]]; then 
  znap source onnefoa/kubectl-fzf shell/
  znap source zsh-users/zsh-history-substring-search
  znap source zsh-users/zsh-autosuggestions
  znap source marlonrichert/zsh-autocomplete
  znap source zsh-users/zsh-completions
  ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
  znap source zsh-users/zsh-syntax-highlighting
  znap source zdharma-continuum/fast-syntax-highlighting
fi

znap source zsh-users/zsh-history-substring-search
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting
znap eval denilsonsa/prettyping 'echo'

# Usage:
# git diff --color | diff-so-fancy         # Use d-s-f on one diff
# cat diff.txt | diff-so-fancy             # Use d-s-f on a diff/patch file
# diff -u one.txt two.txt | diff-so-fancy  # Use d-s-f on unified diff output

# diff-so-fancy --colors                   # View the commands to set the recommended colors
# diff-so-fancy --set-defaults             # Configure git-diff to use diff-so-fancy and suggested colors

znap eval so-fancy/diff-so-fancy 'echo'

znap source pjvds/zsh-cwd

# we don't need this in Arch
# if [[ $(lsb_release -a 2>/dev/null) =~ "Ubuntu" ]]; then 
#   zplug "plugins/ssh-agent", from:oh-my-zsh, defer:3
# fi

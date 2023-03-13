if [ -s /opt/fromgit/zsh-snap/znap.zsh ]; then
  . /opt/fromgit/zsh-snap/znap.zsh
  # one of these overrides <C-q> to quit alacritty if we load these plugins at the end of .zshrc :(
  znap source ohmyzsh/ohmyzsh lib/{clipboard,compfix,directories,functions,history,key-bindings,misc,nvm}.zsh
fi 

# Usage:
# git diff --color | diff-so-fancy         # Use d-s-f on one diff
# cat diff.txt | diff-so-fancy             # Use d-s-f on a diff/patch file
# diff -u one.txt two.txt | diff-so-fancy  # Use d-s-f on unified diff output

# diff-so-fancy --colors                   # View the commands to set the recommended colors
# diff-so-fancy --set-defaults             # Configure git-diff to use diff-so-fancy and suggested colors



if [ -s /opt/fromgit/zsh-snap/znap.zsh ]; then
  . /opt/fromgit/zsh-snap/znap.zsh
  # one of these overrides <C-q> to quit alacritty if we load these plugins at the end of .zshrc :(
  zsh-defer znap source ohmyzsh/ohmyzsh lib/{clipboard,compfix,directories,functions,history,key-bindings,misc,nvm}.zsh
fi 

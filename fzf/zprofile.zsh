rm -f $HOME/.local/bin/uninstall
rm -f $HOME/.local/bin/install

! type fzf 1>/dev/null && {
    znap source junegunn/fzf shell/{completion,key-bindings}.zsh
    /opt/fromgit/fzf/install --no-fish --no-bash --bin
    znap install junegunn/fzf
    rm -f $HOME/.local/bin/install $HOME/.local/bin/uninstall
}

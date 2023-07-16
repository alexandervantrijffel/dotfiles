[ -d $HOME/.krew ] &&  PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
[ -f $HOME/.kube/config ] && export KUBECONFIG=$HOME/.kube/config

type kubectl &>/dev/null && {
    source <(kubectl completion zsh)

    # install go repos, or executables in a repo
    ! type kubectx &>/dev/null && znap install ahmetb/kubectx

    alias k="kubectl"
    alias kgpw="kubectl get pods -w"
    alias kns="kubectl ns"
    alias kgn="kubectl get nodes"
}

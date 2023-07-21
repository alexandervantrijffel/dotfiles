[ -d $HOME/.krew ] && export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
[ -f $HOME/.kube/config ] && export KUBECONFIG=$HOME/.kube/config
[ -f $HOME/.kube/pcb3.8799.nstrein.ns.nl-dev-bench-config ] && export KUBECONFIG=$HOME/.kube/config:$HOME/.kube/pcb3.8799.nstrein.ns.nl-dev-bench-config

type kubectl &>/dev/null && {
    source <(kubectl completion zsh)

    # install go repos, or executables in a repo
    ! type kubectx &>/dev/null && znap install ahmetb/kubectx

    alias k="kubectl"
    alias kgpw="kubectl get pods -w"
    alias kns="kubectl ns"
    alias kgn="kubectl get nodes"
}

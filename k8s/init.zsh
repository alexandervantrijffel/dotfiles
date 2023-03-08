[ -d $HOME/.krew ] &&  PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export KUBECONFIG=$HOME/.kube/config
type kubectl &>/dev/null && source <(kubectl completion zsh)

alias kgpw="kubectl get pods -w"
alias kns="kubectl ns"

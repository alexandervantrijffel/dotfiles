ptf() {
  pt --ignore-case -e $1 | fzf
}

pte() {
  pt --ignore-case -e $1 | fzf
}

ptc() {
  pt --ignore-case --count $1 | fzf
}

pth() {
  pt --ignore-case --hidden $1 | fzf
}

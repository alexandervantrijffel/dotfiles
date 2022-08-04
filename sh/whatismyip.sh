whatismyip() {
  dig +short myip.opendns.com @resolver1.opendns.com | tee /dev/tty | pbcopy
}
# curl icanhazip.com | tac | xclip -selection clipboard
# alternatives:
# curl ifconfig.me
# curl ipecho.net/plain
# curl ifconfig.co

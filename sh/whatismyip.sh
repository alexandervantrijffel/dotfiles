whatismyip() {
  dig +short myip.opendns.com @resolver1.opendns.com
}
# curl icanhazip.com | tac | xclip -selection clipboard
# alternatives:
# curl ifconfig.me
# curl ipecho.net/plain
# curl ifconfig.co

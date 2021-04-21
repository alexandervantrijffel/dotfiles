zplug "plugins/docker", from:oh-my-zsh, defer:3
zplug "plugins/docker-compose", from:oh-my-zsh, defer:3

if type docker 1>/dev/null; then
  alias d="docker "
fi
if type docker-compose 1>/dev/null; then
  alias dc="docker-compose "
fi

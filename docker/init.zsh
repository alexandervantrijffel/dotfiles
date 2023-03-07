zplug "plugins/docker", from:oh-my-zsh, defer:3
# zplug "plugins/docker-compose", from:oh-my-zsh, defer:3

if type docker-compose 1>/dev/null; then
  alias dc="docker-compose "
  alias dcdv="docker-compose down --remove-orphans -v"
  alias dcs="docker-compose stop"
  alias dcrm="docker-compose rm -fs"
elif type docker 1>/dev/null; then
  alias dc="docker compose "
  alias dcdv="docker compose down --remove-orphans -v"
  alias dcs="docker compose stop"
  alias dcrm="docker compose rm -fs"
fi

if type docker 1>/dev/null; then
  alias d="docker"
  alias db="docker build"
  alias dlf="docker logs -f"
  alias dps="docker ps"
  alias dr="docker run"
  alias ds="docker stop"
fi

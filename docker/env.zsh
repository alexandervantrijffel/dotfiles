if type docker 1>/dev/null; then
  alias d="docker"
  alias db="docker build"
  alias dlf="docker logs -f"
  alias dps="docker ps"
  alias dr="docker run"
  alias ds="docker stop"
fi
if type docker-compose 1>/dev/null; then
  alias dc="docker-compose "
  alias dcdv="docker-compose down --remove-orphans -v"
  alias dcs="docker-compose stop"
  alias dcrm="docker-compose rm -fs"
fi


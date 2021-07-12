if type docker 1>/dev/null; then
  alias d="docker"
  alias db="docker build"
  alias dps="docker ps"
  alias dr="docker run"
fi
if type docker-compose 1>/dev/null; then
  alias dc="docker-compose "
  alias dcdv="docker-compose down -v"
  alias dcs="docker-compose stop"
fi


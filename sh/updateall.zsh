#!/bin/zsh
THISDIR=${0:a:h}

tldr -u

go clean -modcache
go get -u all

echo updating yarn packages
yarn global upgrade
yarn cache clean --all

npm cache clean --force

echo updating python packages
sudo python3 -m pip install --upgrade pip
pip install --upgrade pip setuptools wheel
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo -H python3 -m pip install -U
pip cache purge

echo apt update and upgrade
sudo apt update
sudo apt upgrade -y

echo snap refresh and clear cache
sudo snap refresh
sudo rm /var/lib/snapd/cache/*
# 2 is the minimum
sudo snap set system refresh.retain=2

echo updating git repositories
{ cd /opt/fromgit && find . -maxdepth 1 -type d -exec git --git-dir={}/.git --work-tree=$(pwd)/{} pull origin master \; }

if [[ "$ARCH" =~ "arm64" ]]; then 
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  DIR="$(dirname "$(which nvim)")"
  echo dir $DIR
  sudo mv ${DIR}/nvim ${DIR}/nvim.prev
  sudo mv nvim.appimage ${DIR}/nvim
fi

{ cd ~/.SpaceVim && git pull }

if [[ "$ARCH" =~ "arm64" ]]; then 
  { cd /usr/local/bin && sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" }
else
  { cd /usr/local/bin && sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" }
}
fi
sudo chmod +x /usr/local/bin/kubectl

docker system prune -a -f

if type notify-send 1>/dev/null; then
  notify-send -i display "updateall.sh completed"
fi 

sh ${THISDIR}/deleteoldsnapversions.sh

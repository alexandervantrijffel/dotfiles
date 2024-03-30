#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

tldr -u

go clean -modcache

echo updating yarn packages
# yarn global upgrade
yarn cache clean --all

npm cache clean --force

echo updating python packages
sudo python3 -m pip install --upgrade pip
# pip install --upgrade pip setuptools wheel
# pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo -H python3 -m pip install -U
pip cache purge

# echo apt update and upgrade
# sudo apt update
# sudo apt upgrade -y

# echo snap refresh and clear cache
# sudo snap refresh
# sudo rm /var/lib/snapd/cache/*
# # 2 is the minimum
# sudo snap set system refresh.retain=2

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

nvim --noplugin +PlugUpgrade +PlugUpdate +PlugClean! +qall

# { cd ~/.SpaceVim && git pull }

if [[ "$ARCH" =~ "arm64" ]]; then
    { cd /usr/local/bin && sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" }
else
    { cd /usr/local/bin && sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" }
fi
sudo chmod +x /usr/local/bin/kubectl

sudo docker system prune -a -f

pnpm store prune

type notify-send 1>/dev/null && notify-send -i display "updateall.sh completed"

if [[ $(lsb_release -a 2>/dev/null) =~ "Ubuntu" ]]; then
sh ${THISDIR}/deleteoldsnapversions.sh
fi

if [ -s /opt/fromgit/zsh-snap/znap.zsh ]; then
source /opt/fromgit/zsh-snap/znap.zsh
znap pull
fi

nvm upgrade

type rustup > /dev/null 2>&1 && {
  rustup self update
  rustup update
}

sudo paccache -r
sudo pacman -Syu
yay -Scc --noconfirm
# cleanup outdated build files of projects with this command inside the project directory
# cargo sweep --time 30

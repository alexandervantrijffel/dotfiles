#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"


# update saw for aws cloudwatch logs in the console
# by navigating to https://github.com/TylerBrock/saw/releases
# install .deb package with `_ dpkg -i <file.deb>`
go install github.com/TylerBrock/saw@latest

# if [ -s /opt/fromgit/zsh-snap/znap.zsh ]; then
# source /opt/fromgit/zsh-snap/znap.zsh
# znap pull
# fi

# echo updating git repositories
# { cd /opt/fromgit && find . -maxdepth 1 -type d -exec git --git-dir={}/.git --work-tree=$(pwd)/{} pull origin master \; }

tldr -u

go clean -modcache
# get latest version of gopls
go install golang.org/x/tools/gopls@latest
# get latest version of golangci-lint
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin

go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install github.com/cortesi/modd/cmd/modd@latest

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

# if [[ "$ARCH" =~ "arm64" ]]; then
#     { cd /usr/local/bin && sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" }
# else
#     { cd /usr/local/bin && sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" }
# fi
# sudo chmod +x /usr/local/bin/kubectl

sudo docker system prune -a -f

pnpm store prune

nvm upgrade

type rustup > /dev/null 2>&1 && {
  rustup self update
  rustup update
}

type paccache > /dev/null 2>&1 && {
  sudo paccache -r
}
type pacman > /dev/null 2>&1 && {
  sudo pacman -Syu
}
type yay > /dev/null 2>&1 && {
  yay -Scc --noconfirm
}
# cleanup outdated build files of projects with this command inside the project directory
# cargo sweep --time 30
#
type cargo > /dev/null 2>&1 && {
  cargo install cargo-watch
  cargo install cargo-nextest --locked
}

type rustup > /dev/null 2>&1 && {
  echo updating yarn packages
  # yarn global upgrade
  yarn cache clean --all || true
}

type notify-send 1>/dev/null && notify-send -i display "updateall.sh completed"

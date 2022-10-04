#!/bin/zsh
tldr -u

source $ZPLUG_HOME/init.zsh
source ~/.zshrc
zplug update
zplug clean
zplug clear

echo updating yarn packages
yarn global upgrade
yarn set version latest
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

{ cd ~/.SpaceVim && git pull }

{ cd /usr/local/bin && sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" }
sudo chmod +x /usr/local/bin/kubectl

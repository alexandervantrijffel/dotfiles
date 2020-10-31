#!/bin/zsh
source $ZPLUG_HOME/init.zsh
source ~/.zshrc
zplug update
zplug clean
zplug clear

# echo updating go packages
go get -u all

echo updating yarn packages
yarn global upgrade

echo updating python packages
sudo pip3 install --upgrade pip
sudo -H pip install --upgrade pip setuptools wheel
sudo -H pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo -H python3 -m pip install -U

echo apt update and upgrade
sudo apt update
sudo apt upgrade -y

echo updating git repositories
cd /opt/fromgit
find . -maxdepth 1 -type d -exec git --git-dir={}/.git --work-tree=$(pwd)/{} pull origin master \;

cd ~/.SpaceVim
git pull

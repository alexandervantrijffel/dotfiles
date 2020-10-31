#!/bin/zsh
source $ZPLUG_HOME/init.zsh
source ~/.zshrc
zplug update
zplug clean
zplug clear

echo updating go packages
go get -u all

echo updating yarn packages
yarn global upgrade

echo updating python packages
pip3 install --upgrade pip
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U

echo apt update and upgrade
sudo apt update
sudo apt upgrade -y

echo updating git repositories
cd /opt/fromgit
find . -maxdepth 1 -type d -exec git --git-dir={}/.git --work-tree=$(pwd)/{} pull origin master \;

cd ~/.SpaceVim
git pull

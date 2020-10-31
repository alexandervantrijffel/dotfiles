zplug update
go get -u all
yarn global upgrade
pip3 install --upgrade pip
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
sudo apt update
sudo apt upgrade -y

cd /opt/rofimoji
git pull
cd /opt/fromgit
find . -maxdepth 1 -type d -exec git --git-dir={}/.git --work-tree=$(pwd)/{} pull origin master \;

cd ~/.SpaceVim
git checkout master
git pull
git checkout customizations
git rebase master


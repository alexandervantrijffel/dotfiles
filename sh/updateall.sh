go get -u all
yarn global upgrade
pip3 install --upgrade pip
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
sudo apt update
sudo apt upgrade -y
cd /opt/dracularofi
git pull
cd /opt/rofimoji
git pull
cd /data/dev/github.com/alexandervantrijffel/dotfiles/home/qutebrowser/.config/qutebrowser/dracula
git pull
cd /data/dev/github.com/qutebrowser-latest
git pull
cd ~/.SpaceVim
git checkout master
git pull
git checkout customizations
git rebase master

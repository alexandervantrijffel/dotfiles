#!/bin/sh

set -e

THISDIR=$(cd `dirname $0` && pwd)
DOTFILES="$(dirname "$THISDIR")"

if [ "$(uname)" = "Darwin" ]; then
  # no last login message on mac
  touch ~/.hushlogin

  brew install ack fortune cowsay lolcat python exa lnav z
else
  source "$THISDIR/newmachine_apt.sh"
  echo todo install dmenu and i3-gaps for i3
  read blah
fi

lnav -i $(pwd)/.lnav/formats/*.json

FORTUNES="/usr/share/games/fortunes"
if [ ! -d $FORTUNES ]; then
  FORTUNES="/usr/local/share/games/fortunes"
fi
echo "Replacing folder $FORTUNES"
sudo rm -rf $FORTUNES
sudo ln -s $DOTFILES/fortunes $FORTUNES

sudo mkdir -pv /usr/local/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | NVM_DIR=/usr/local/nvm sudo bash
sudo ln -s $DOTFILES/node/nvmprofile.sh /etc/profile.d/

sudo nvm install node

sudo npm install -g npm typescript typescript-language-server bash-language-server

# latest yarn 3 or higher
sudo corepack enable
sudo corepack prepare yarn@stable --activate

# yarn v2https://support.apple.com/kb/SP825?locale=en_US
# npm install -g yarn@berry

sudo mkdir -pv /usr/local/share/.config/yarn
sudo chmod 777 -R /usr/local/share/.cache

sudo npm install -g global add prettier eslint import-js neovim ts-node typescript typescript-language-server

sudo ln -s $(pwd)/../sh/autotestgo.sh /usr/local/bin/autotestgo
sudo ln -s $(pwd)/../sh/autorungo.sh /usr/local/bin/autorungo
sudo ln -s $(pwd)/../sh/whatismyip.sh /usr/local/bin/whatismyip

# from https://github.com/so-fancy/diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"


echo "Setup bluetooth as described in https://github.com/ev3dev/ev3dev.github.io/pull/24/files/50787e9fae767f4a8e5e1748c5bb70b40eb9f259"
echo "and https://wiki.debian.org/BluetoothUser/a2dp"

echo "todo on ubuntu: install z manually: https://github.com/rupa/z"
echo "to change caps lock to control on ubuntu, edit /usr/share/X11/xkb/symbols/pc Don't change evdev!"
echo "refer to https://askubuntu.com/questions/33774/how-do-i-remap-the-caps-lock-and-ctrl-keys"
echo ""
echo "install go manually before continueing: https://golang.org/dl/"
read blah

go get -u github.com/cespare/reflex
go get -u github.com/golangci/golangci-lint
go get -u gotest.tools/gotestsum
go get -u github.com/stretchr/testify/assert
go get -u github.com/jstemmer/gotags
go get -u github.com/maruel/panicparse/v2/cmd/pp

sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim
sudo update-alternatives --config editor

echo "only on native:"
echo "apt install feh pulseaudio shutter"

echo "todo: set correct dpi in ~/.Xresources"
echo "Xft.dpi:110" > ~/.Xresources

echo "todo link .xsessionrc"

echo "only in vm"
echo "sudo apt install open-vm-tools open-vm-tools-desktop -y"

  # sudo apt install wl-clipboard grim

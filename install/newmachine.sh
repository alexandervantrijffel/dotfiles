#!/bin/sh

THISDIR=$(cd `dirname $0` && pwd)
DOTFILES="$(dirname "$THISDIR")"

if [ "$(uname)" = "Darwin" ]; then
  # no last login message on mac
  touch ~/.hushlogin

  brew install ack fortune cowsay lolcat yarn python exa lnav z
else
  # i3 gaps
  sudo add-apt-repository ppa:kgilmer/speed-ricer
  sudo apt update && sudo apt install curl apt-transport-https
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  curl -o- -L https://yarnpkg.com/install.sh | bash
  sudo apt update && sudo apt install pip yarn python3-pip bat -y
  pip3 install --user --upgrade pynvim     
  sudo apt install htop fortune lnav terminator -ag -y
  sudo apt install fonts-powerline tig cowsay fortune fd-find -y
  sudo apt install inotify-tools -y
  sudo apt install maim xclip xdotool -y
  cp $THISDIR/meow /usr/share/cowsay/cows/

  # i3 extensions
  sudo apt i3-gaps-wm install rofi alsa-utils i3blocks -y 
  ln -s $DOTFILES/.config/i3/ $HOME/.i3/
  sudo mv /usr/bin/dmenu /usr/bin/dmenu.org
  sudo ln -s $(which rofi) /usr/bin/dmenu

  # sudo apt-get build-dep shotwell
  # sudo apt-get install yelp-tools appstream-util libgcr-3-dev libgdata-dev libwebp-dev

  # todo install exa manually

  # teiler
  # sudo apt install xininfo ffmpeg xclip maim slop -y
  # sudo git clone https://github.com/carnager/teiler.git /opt/teiler
  # sudo ln -s /opt/teiler/teiler /usr/local/bin/
  # sudo ln -s /opt/teiler/teiler_helper /usr/local/bin/
  # mkdir -pv ~/.config/teiler/profiles/mp4-pulse

  # install teiler as described at https://carnager.github.io/teiler/
fi

lnav -i $(pwd)/.lnav/formats/*.json

FORTUNES="/usr/share/games/fortunes"
if [ ! -d $FORTUNES ]; then
  FORTUNES="/usr/local/share/games/fortunes"
fi
echo "Replacing folder $FORTUNES"
sudo rm -rf $FORTUNES
sudo ln -s $DOTFILES/fortunes $FORTUNES

yarn global add prettier eslint import-js neovim ts-node typescript

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

sudo apt autoremove -y

echo "Setup bluetooth as described in https://github.com/ev3dev/ev3dev.github.io/pull/24/files/50787e9fae767f4a8e5e1748c5bb70b40eb9f259"
echo "and https://wiki.debian.org/BluetoothUser/a2dp"

echo "todo on ubuntu: install z manually: https://github.com/rupa/z"
echo "to change caps lock to control on ubuntu, edit /usr/share/X11/xkb/symbols/pc Don't change evdev!"
echo "refer to https://askubuntu.com/questions/33774/how-do-i-remap-the-caps-lock-and-ctrl-keys"
echo ""
echo "install go manually before continueing: https://golang.org/dl/"
read blah

sudo apt install ctags
go get -u github.com/cespare/reflex
go get -u github.com/golangci/golangci-lint
go get -u gotest.tools/gotestsum
go get -u github.com/stretchr/testify/assert
go get -u github.com/jstemmer/gotags
go get -u github.com/maruel/panicparse/v2/cmd/pp

sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim 0
sudo update-alternatives --config editor

echo "only on native:"
echo "apt install feh pulseaudio shutter"

echo "todo: set correct dpi in ~/.Xresources"
echo "Xft.dpi:110" > ~/.Xresources

echo "todo link .xsessionrc"

echo "only in vm"
echo "sudo apt install open-vm-tools open-vm-tools-desktop -y"

  # sudo apt install wl-clipboard grim

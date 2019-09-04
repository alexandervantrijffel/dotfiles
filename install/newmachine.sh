#!/bin/sh

THISDIR=$(cd `dirname $0` && pwd)
DOTFILES="$(dirname "$THISDIR")"
echo "DOTFILES is $DOTFILES"

if [ "$(uname)" = "Darwin" ]; then
  # no last login message on mac
  touch ~/.hushlogin

  brew install ack fortune cowsay lolcat yarn python exa lnav z
else
  sudo apt update && sudo apt install curl
  # 
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  curl -o- -L https://yarnpkg.com/install.sh | bash
  sudo apt update && sudo apt install pip yarn python3-pip -y
  sudo apt install feh htop fortune shutter lnav i3 -y
  sudo apt install silversearcher-ag exa fonts-powerline tig autojump cowsay fortune -y

  # i3 extensions
  sudo apt install rofi alsa-utils pulseaudio i3blocks -y 

  ln -s $DOTFILES/home/.i3 $HOME/.i3 

  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 
  ~/.fzf/install 

  curl https://github.com/sharkdp/bat/releases/download/v0.11.0/bat_0.11.0_amd64.deb -o bat_0.11.0_amd64.deb
  sudo dpkg -i bat_0.11.0_amd64.deb # adapt version number and architecture

  sudo apt install zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  chsh -s $(which zsh)

  # sudo apt-get build-dep shotwell
  # sudo apt-get install yelp-tools appstream-util libgcr-3-dev libgdata-dev libwebp-dev

  # todo install exa manually

  # teiler
  sudo apt install xininfo ffmpeg xclip maim slop -y
  sudo git clone https://github.com/carnager/teiler.git /opt/teiler
  sudo ln -s /opt/teiler/teiler /usr/local/bin/
  sudo ln -s /opt/teiler/teiler_helper /usr/local/bin/
  mkdir -pv ~/.config/teiler/profiles/mp4-pulse

  # install teiler as described at https://carnager.github.io/teiler/
fi

lnav -i $(pwd)/home/.lnav/formats/*.json

FORTUNES="/usr/share/games/fortunes"
if [ ! -d $FORTUNES ]; then
  FORTUNES="/usr/local/share/games/fortunes"
fi
echo "Replacing folder $FORTUNES"
sudo rm -rf $FORTUNES
sudo ln -s $DOTFILES/fortunes $FORTUNES

yarn global add standard prettier-standard babel-eslint eslint eslint-plugin-prettier install pynvim import-js

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

sudo ln -s $(pwd)/../sh/autotestgo.sh /usr/local/bin/autotestgo
sudo ln -s $(pwd)/../sh/autorungo.sh /usr/local/bin/autorungo
sudo ln -s $(pwd)/../sh/whatismyip.sh /usr/local/bin/whatismyip


sudo apt autoremove -y

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
go get gotest.tools/gotestsum

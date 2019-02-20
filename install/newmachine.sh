#!/bin/sh

THISDIR=$(cd `dirname $0` && pwd)
DOTFILES="$(dirname "$THISDIR")"

if [ "$(uname)" = "Darwin" ]; then
  # no last login message on mac
  touch ~/.hushlogin

  brew install ack fortune cowsay lolcat
else
  sudo apt update && sudo apt install curl zsh the-silver-searcher feh htop fortune shutter -y

  # i3 extensions
  sudo apt install rofi alsa-utils pulseaudio i3blocks -y 

  # todo! download battery i3blocks script from https://github.com/vivien/i3blocks-contrib/tree/master/battery
  # and store as executable file /usr/share/i3blocks/battery

  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 
  ~/.fzf/install 

  sudo dpkg -i bat_0.10.0_amd64.deb # adapt version number and architecture

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # sudo apt-get build-dep shotwell
  # sudo apt-get install yelp-tools appstream-util libgcr-3-dev libgdata-dev libwebp-dev
fi

FORTUNES="/usr/share/games/fortunes"
if [ ! -d $FORTUNES ]; then
  FORTUNES="/usr/local/share/games/fortunes"
fi
echo "DOTFILES is $DOTFILES"
echo "Replacing folder $FORTUNES"
sudo rm -rf $FORTUNES
sudo ln -s $DOTFILES/fortunes $FORTUNES

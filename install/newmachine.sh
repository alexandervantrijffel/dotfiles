#!/bin/sh

THISDIR=$(cd `dirname $0` && pwd)
DOTFILES="$(dirname "$THISDIR")"
echo "DOTFILES is $DOTFILES"

if [ "$(uname)" = "Darwin" ]; then
  # no last login message on mac
  touch ~/.hushlogin

  brew install ack fortune cowsay lolcat yarn python
else
  # 
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

  sudo apt update && sudo apt install yarn python3-pip curl zsh the-silver-searcher feh htop fortune shutter -y

  # i3 extensions
  sudo apt install rofi alsa-utils pulseaudio i3blocks -y 

  ln -s $DOTFILES/home/.i3 $HOME/.i3 

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
echo "Replacing folder $FORTUNES"
sudo rm -rf $FORTUNES
sudo ln -s $DOTFILES/fortunes $FORTUNES

yarn global add standard prettier-standard babel-eslint eslint eslint-plugin-prettier
pip3 install pynvim

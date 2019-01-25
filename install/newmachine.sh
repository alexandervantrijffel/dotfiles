#!/bin/sh

# no last login message on mac
touch ~/.hushlogin

THISDIR=$(cd `dirname $0` && pwd)
DOTFILES="$(dirname "$THISDIR")"

if [ "$(uname)" == "Darwin" ]; then
  brew install ack fortune cowsay lolcat
else
  apt update && apt install the-silver-searcher
fi

FORTUNES="/usr/share/games/fortunes"
if [ ! -d $FORTUNES ]; then
  FORTUNES="/usr/local/share/games/fortunes"
fi
echo "DOTFILES is $DOTFILES"
echo "Replacing folder $FORTUNES"
sudo rm -rf $FORTUNES
sudo ln -s $DOTFILES/fortunes $FORTUNES

# mac: brew install neovim

curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
mv ./nvim.appimage /usr/bin/nvim

ln -s $HOME/.SpaceVim $HOME/.config/nvim
ln -s ~/.vim ~/.SpaceVim

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DOTFILES="$(dirname "$THISDIR")"
ln -s $DOTFILES/home/.SpaceVim.d ~/.SpaceVim.d

yarn global add neovim
sudo pip install --upgrade pip
sudo pip2 install --upgrade neovim
sudo pip3 install --upgrade neovim

echo 'export PATH="/usr/local/opt/gettext/bin:$PATH"' >> ~/.zshrc.local
echo 'export LDFLAGS="-L/usr/local/opt/gettext/lib"' >> ~/.zshrc.local
echo 'export CPPFLAGS="-I/usr/local/opt/gettext/include"' >> ~/.zshrc.local

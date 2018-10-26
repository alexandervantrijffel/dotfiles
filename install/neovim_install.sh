# mac: brew install neovim

curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

ln -s $HOME/.SpaceVim $HOME/.config/nvim

yarn global add neovim
sudo pip install --upgrade pip
sudo pip2 install --upgrade neovim
sudo pip3 install --upgrade neovim

echo 'export PATH="/usr/local/opt/gettext/bin:$PATH"' >> ~/.zshrc.local
echo 'export LDFLAGS="-L/usr/local/opt/gettext/lib"' >> ~/.zshrc.local
echo 'export CPPFLAGS="-I/usr/local/opt/gettext/include"' >> ~/.zshrc.local

#!/bin/sh

apt-get install -y ubuntu-drivers-common
# apt-get install -y ubuntu-restricted-extras
apt-get install -y openssh-client
apt-get install -y libstartup-notification0 
apt-get install -y evince evince-common
apt-get install -y lightdm
apt-get install -y antoconf automake
apt-get install -y x11-xserver-utils
apt-get install -y arandr
apt-get install -y pavucontrol
apt-get install -y dconf dconf-tools
apt-get install -y python-gconf
apt-get install -y lxappearance
apt-get install -y thunar
apt-get install -y network-manager
apt-get install -y network-manager-openvpn
apt-get install -y brasero
apt-get install -y totem-plugins gromit
apt-get install -y gstreamer1.0-pulseaudio
apt-get install -y transmission-gtk
apt-get install -y pactl xbacklight
apt-get install -y feh
apt-get install -y rofi compton
apt-get install -y git
apt-get install -y i3 i3-wm i3blocks i3lock i3status
apt-get install -y acpi-support
apt-get install -y cups cups-bsd cups-client cups-filters
apt-get install -y foomatic-db-compressed-ppds
apt-get install -y openprinting-ppds
apt-get install -y bluez
apt-get install -y bluez-cups
apt-get install -y hplip
apt-get install -y python3-aptdaemon.pkcompat
apt-get install -y evince evince-common
apt-get install -y libssh-4 libnm-glib-vpn1
apt-get install -y fonts-arphic-ukai fonts-arphic-uming
apt-get install -y fonts-dejavu-core fonts-freefont-ttf
apt-get install -y fonts-guru fonts-guru-extra fonts-kacst
apt-get install -y fonts-kacst-one fonts-khmeros-core
apt-get install -y fonts-liberation fonts-opensymbol
apt-get install -y fonts-nanum fonts-stix fonts-symbola
apt-get install -y xfonts-base xfonts-encodings
apt-get install -y xfonts-scalable xfonts-utils
apt-get install -y libxfont1 libfont-afm-perl
apt-get install -y libfontconfig1 libfontembed1
apt-get install -y libfontenc1 
apt-get install -y fontconfig fontconfig-config
apt-get install -y dmz-cursor-theme libwayland-cursor0
apt-get install -y libxcursor1 xcursor-themes
apt-get install -y mousetweaks
apt-get install -y update-inetd update-notifier
apt-get install -y update-notifier-common
apt-get install -y libgsettings-qt1
apt-get install -y libproxy1-plugin-gsettings
apt-get install -y libappindicator3-1
apt-get install -y gir1.2-appindicator3-0.1 gdebi
apt-get install -y caffeine

##### Get and install infinality (better font rendering)
add-apt-repository ppa:no1wantdthisname/ppa -y
apt-get update
apt-get upgrade -y
apt-get install -y fontconfig-infinality

# i3 gaps
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt update && sudo apt install curl apt-transport-https
sudo apt update && sudo apt install pip python3-pip bat -y
pip3 install --user --upgrade pynvim     
sudo apt install htop fortune lnav terminator -ag -y
sudo apt install fonts-powerline tig cowsay fortune fd-find -y
sudo apt install inotify-tools -y
sudo apt install maim xclip xdotool -y
cp $THISDIR/meow /usr/share/cowsay/cows/

# i3 extensions
sudo apt i3-gaps-wm install rofi alsa-utils i3blocks -y 
ln -s $DOTFILES/.config/i3/ $HOME/.i3/
# i3 gaps
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt update && sudo apt install curl apt-transport-https
sudo apt update && sudo apt install pip python3-pip bat -y
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

curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt autoremove -y

sudo apt install ctags

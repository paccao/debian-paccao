#!/bin/bash

## This script is a modification of Chris Titus script, https://github.com/ChrisTitusTech/Debian-titus/blob/main/install.sh

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list

username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
apt update
apt upgrade -y

# Install nala
apt install nala -y

# Making .config and Moving config files and background to Pictures
cd $builddir
mkdir -p /home/$username/.config
mkdir -p /home/$username/.fonts
mkdir -p /home/$username/Pictures/Backgrounds
cp .Xresources /home/$username
cp -R dotconfig/* /home/$username/.config/
cp -R Backgrounds /home/$username/Pictures/
cp .bash_profile /home/$username/
mv user-dirs.dirs /home/$username/.config
chown -R $username:$username /home/$username
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.vimrc

# Installing Essential Programs
nala install xinit -y
nala install --no-install-recommends feh i3 suckless-tools sxhkd xclip rxvt-unicode rofi ranger picom nitrogen lxpolkit flameshot x11-xserver-utils unzip yad wget pulseaudio pulseeffects vim-gtk tmux pavucontrol arandr xbindkeys trash-cli powerline-fonts net-tools -y
# Installing Other less important Programs
nala install --no-install-recommends neofetch htop tldr papirus-icon-theme fonts-noto-color-emoji fonts-font-awesome ripgrep -y

# Installing fonts
cd $builddir
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts
mv dotfonts/fontawesome/otfs/*.otf /home/$username/.fonts/
chown $username:$username /home/$username/.fonts/*

# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip

# Install brave-browser
nala install --no-install-recommends apt-transport-https curl --no-install-recommends -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install --no-install-recommends brave-browser -y

echo "Installation complete. Now quit your current tty session and log in again"
echo "If you are currently logged in as the root user, type `exit`"
echo "Otherwise press CTRL+d until you are prompted to log into your username again."

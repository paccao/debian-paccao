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
mkdir -p /home/$username/Pictures/Backgrounds
mkdir -p /home/$username/.screenlayout
mkdir -p /home/$username/.fonts

cp -R dotconfig/* /home/$username/.config/
cp -R Backgrounds /home/$username/Pictures/
cp -R .screenlayout /home/$username/.screenlayout

cp .Xmodmap /home/$username
cp .Xresources /home/$username
cp .bash_aliases /home/$username
cp .bash_profile /home/$username
cp .bashrc /home/$username
cp .tmux.conf /home/$username
cp .vimrc /home/$username
cp .xinitrc /home/$username
cp users-dirs.dirs /home/$username/.config

chown -R $username:$username /home/$username

# Installing Essential Programs
nala install xinit -y
nala install --no-install-recommends feh i3 suckless-tools sxhkd xclip rxvt-unicode rofi ranger picom nitrogen lxpolkit flameshot x11-xserver-utils unzip yad wget pulseaudio pulseeffects vim-gtk3 tmux pavucontrol arandr xbindkeys trash-cli fonts-powerline net-tools -y
# Installing Other less important Programs (Certain programs are needed for various scripts in my config)
nala install --no-install-recommends neofetch htop tldr papirus-icon-theme fonts-noto-color-emoji fonts-font-awesome ripgrep fzf inxi lspci pactl bat -y

# Installing fonts
cd /home/$username
curl -JLO https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip -o Hack-v3.zip
unzip Hack-v3.zip
cp ttf/* ~/.fonts
chown $username:$username /home/$username/.fonts/*

# Reloading Font
fc-cache -vf
# Removing zip Files
trash ttf Hack-v3.003-ttf.zip

# Install brave-browser
nala install --no-install-recommends apt-transport-https curl --no-install-recommends -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install --no-install-recommends brave-browser -y

echo "Install script completed."
sudo reboot

#!/usr/bin/bash

# Create custom ls alias
echo "alias l='ls -AlhF'" >> ~/.bashrc
echo "alias g='git'" >> ~/.bashrc
echo "alias gp='git pull'" >> ~/.bashrc
echo "alias gs='git status'" >> ~/.bashrc
echo "alias ga='git add .'" >> ~/.bashrc
echo "alias gf='git fetch'" >> ~/.bashrc

# Autostart programs
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "exec xclip &
exec i3" >> ~/.xinitrc

cd ~ &&
source .bashrc &&
source .bash_profile &&
source .xinitrc
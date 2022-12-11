#!/usr/bin/bash

# Create custom ls alias
echo "alias l='ls -AlhF'" >> /home/$username/.bashrc
echo "alias g='git'" >> /home/$username/.bashrc
echo "alias gp='git pull'" >> /home/$username/.bashrc
echo "alias gs='git status'" >> /home/$username/.bashrc
echo "alias ga='git add .'" >> /home/$username/.bashrc
echo "alias gf='git fetch'" >> /home/$username/.bashrc

# Autostart programs
cp /etc/X11/xinit/xinitrc /home/$username/.xinitrc
echo "exec xclip &
exec i3" >> /home/$username/.xinitrc

cd ~ &&
source .bashrc &&
source .bash_profile &&
source .xinitrc
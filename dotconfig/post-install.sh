#!/usr/bin/bash

# Create custom ls alias
echo "alias l='ls -AlhF'" >> ~/.bashrc

# Autostart programs
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "exec xclip &
exec i3" >> ~/.xinitrc
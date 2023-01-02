#!/usr/bin/bash

set -e

cd ~
cp -a .config/i3/ debian-paccao/dotconfig/
cp .Xresources debian-paccao/ 
cp .Xmodmap debian-paccao/
cp .vimrc debian-paccao/
cp .tmux.conf debian-paccao/
cp -a .screenlayout debian-paccao/
cp .xinitrc debian-paccao/
cp update-dotfiles.sh debian-paccao/
cp .bashrc debian-paccao/
cp .bash_aliases debian-paccao/

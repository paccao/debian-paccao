#!/bin/sh

# invoke global X session script
. /etc/X11/Xsession
xmodmap ~/.Xmodmap
exec picom &
exec xclip &
exec flameshot &
exec i3

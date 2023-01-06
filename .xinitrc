#!/bin/sh

# invoke global X session script
. /etc/X11/Xsession
xmodmap ~/.Xmodmap
exec iclip &
exec flameshot &
exec i3

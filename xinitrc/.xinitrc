#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession
xmodmap /home/will/.Xmodmap &
xrdb -merge ~/.Xresources
exec i3

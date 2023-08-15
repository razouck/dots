#!/bin/sh

userresources="$HOME/.Xresources"

if [ -f "$userresources" ]
then
	xrdb -merge "$userresources"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]
then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh
	do
		[ -x "$f" ] && . "$f"
	done
fi

if xrandr --listmonitors | grep -q 'HDMI-'
then
	xrandr --output LVDS-1 --off
fi

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
udiskie &
xbindkeys
dunst &
feh --bg-fill ~/Imagens/wallpapers/03.png &
exec spectrwm

# I should probably code a script that'll set the screen brightness depending on
# the time of the day.

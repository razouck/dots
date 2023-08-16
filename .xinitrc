#!/bin/sh

#
#                               o8o               o8o      .
#                               `"'               `"'    .o8
#                  oooo    ooo oooo  ooo. .oo.   oooo  .o888oo
#                   `88b..8P'  `888  `888P"Y88b  `888    888
#                     Y888'     888   888   888   888    888
#                   .o8"'88b    888   888   888   888    888 .
#                  o88'   888o o888o o888o o888o o888o   "888"
#
#--------------------------------------------------------------------------------
#--------------------------------------------------------------------------------
#--------------------------------------------------------------------------------
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


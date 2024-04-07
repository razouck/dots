#!/bin/sh
#
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
wallpapers="$HOME/Imagens/wallpapers/"

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

dunst &
udiskie &
xbindkeys
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
feh --randomize --bg-fill "$wallpapers" &
exec spectrwm

#!/bin/sh

PICDIR=$(xdg-user-dir PICTURES)/captures/$(date +%Y)
PICNAME=$(date +"%F_%H.%M.%S").png
PIC="$PICDIR/$PICNAME"

screenshot() {
	case $1 in
	all    )
		import -window root "$PIC"
		dunstify -i "$PIC" \
			"Captura de tela realizada!" \
			"$PICNAME"
		;;
	window )
		sleep 1
		scrot -s
		;;
	area   )
		flameshot gui
		;;
	*      )
		;;
	esac;

}

screenshot $1


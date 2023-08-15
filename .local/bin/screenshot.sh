#!/bin/sh

FILEPATH=$(xdg-user-dir PICTURES)/captures/$(date +%Y)
FILENAME=$(date +"%F_%H.%M.%S").png

screenshot() {
	case $1 in
	all    )
		import -window root "$FILEPATH/$FILENAME"
		;;
	window )
		sleep 1
		scrot -s
		;;
	*      )
		;;
	esac;
}

screenshot $1


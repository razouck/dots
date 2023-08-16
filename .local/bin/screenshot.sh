#!/bin/sh
#
#
#                                       .
#                                     .o8
#      .ooooo.   .oooo.   oo.ooooo.  .o888oo oooo  oooo  oooo d8b  .ooooo.
#     d88' `"Y8 `P  )88b   888' `88b   888   `888  `888  `888""8P d88' `88b
#     888        .oP"888   888   888   888    888   888   888     888ooo888
#     888   .o8 d8(  888   888   888   888 .  888   888   888     888    .o
#     `Y8bod8P' `Y888""8o  888bod8P'   "888"  `V88V"V8P' d888b    `Y8bod8P'
#                          888
#-------------------------o888o--------------------------------------------------
#--------------------------------------------------------------------------------
#--------------------------------------------------------------------------------
PICDIR=$(xdg-user-dir PICTURES)/captures/$(date +%Y)
PICNAME=$(date +"%F_%H.%M.%S").png
PIC="$PICDIR/$PICNAME"


screenshot() {
	case $1 in
	all    )
		import -window root "$PIC"
		notify
		;;
	window )
		magick import "$PIC"
		notify
		;;
	area   )
		flameshot gui
		;;
	*      )
		;;
	esac;
}
# Now all I need to to is code the clipboard version of this script.


notify() {
	dunstify -i "$PIC" \
		"Captura de tela realizada!" \
		"$PICNAME"
}

screenshot $1


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
FILENAME=$(date +"%F_%H.%M.%S").png
FILEPATH="$PICDIR/$FILENAME"

mkdir -p "$PICDIR"

function cmd()
{
	case $1 in
		all    ) maim "$2"                               ;;
		window ) maim -i $(xdotool getactivewindow) "$2" ;;
		area   ) maim -s "$2"                            ;;
	esac
}

function notify()
{
	dunstify -i "$FILEPATH" \
		"Captura de tela realizada!" \
		"$FILENAME"
}

function run_cmd()
{
	if [ "$2" == file ]
	then
		cmd "$1" "$FILEPATH"
		notify
	
	elif [ "$2" == clipboard ]
	then
		cmd "$1" | xclip -selection clipboard -t image/png
	fi
}


run_cmd $1 $2

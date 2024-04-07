#!/bin/bash
#
#
#                         .o8
#                        "888
#                         888oooo.   .oooo.   oooo d8b
#                         d88' `88b `P  )88b  `888""8P
#                         888   888  .oP"888   888
#                         888   888 d8(  888   888
#                         `Y8bod8P' `Y888""8o d888b
#
#--------------------------------------------------------------------------------
#---------------------------------- Functions -----------------------------------
#--------------------------------------------------------------------------------
choose_bgcolor() {
	# TODO
	# Add suport for direction.
	# Add support for no icons.

	SEPARATOR=$(choose_icon left $2)
	#           ^ Make sure you have a nerd font as `bar_font_pua`.

	case $1 in

	[2-9])
		bgcolor=$1
		;;
	"0" | "normal")

		echo -n "+@fg=1;$SEPARATOR+@fg=0;+@bg=0;"
		exit
		;;
	"1" | "invert")

		echo -n "+@fg=0;$SEPARATOR+@fg=1;+@bg=1;"
		exit
		;;

	"red") bgcolor=2 ;;
	"green") bgcolor=3 ;;
	"yellow") bgcolor=4 ;;
	"blue") bgcolor=5 ;;
	"magenta") bgcolor=6 ;;
	"cyan") bgcolor=7 ;;
	"orange") bgcolor=8 ;;
	"violet") bgcolor=9 ;;
	esac

	echo "+@fg=$bgcolor;$SEPARATOR+@fg=1;+@bg=$bgcolor;"
}

choose_icon() {
	# It only works if you have a nerd font as `bar_font_pua`.
	case $1 in

	left)
		case $2 in
		1) icon="" ;;
		2) icon="" ;;
		3) icon="" ;;
		4) icon="" ;;
		5) icon="" ;;
		6) icon="" ;;
		7) icon="" ;;
		esac
		;;
	right)
		case $2 in
		1) icon="" ;;
		2) icon="" ;;
		3) icon="" ;;
		4) icon="" ;;
		5) icon="" ;;
		6) icon="" ;;
		7) icon="" ;;
		esac
		;;
	esac
	echo $icon
}

recording_section() {
	FILE=/tmp/recording

	if [ -e $FILE ]; then
		echo "+@fg=2;+@fg=0;"
		exit
	fi
}

up_section() {
	line=$(uptime -p)
	line=${line//s/}
	line=${line/up /}
	line=${line/, / }
	line=${line/ hour/h}
	line=${line/ minute/m}

	COLOR="invert"

	if [[ $line == *h* ]]; then
		hour=$(echo $line | cut -d " " -f 1)
		hour=${hour:0:(-1)}

		if [ $hour -ge 6 ]; then
			COLOR="red"

		elif [ $hour -ge 3 ]; then
			COLOR="orange"

		elif [ $hour -ge 2 ]; then
			COLOR="yellow"
		fi

		echo "$(choose_bgcolor $COLOR $1) $line"
		exit
	fi
	echo "$(choose_bgcolor $COLOR $1) $line"
}

#--------------------------------------------------------------------------------
#----------------------------------- Bar Loop -----------------------------------
#--------------------------------------------------------------------------------
n=1

while :; do
	echo -n "+<+I "
	echo -n "+@fn=1;+@bg=1;+@fg=1;$(choose_icon right $n) +S +@fn=0;"
	echo -n "+@bg=0;+@fg=0;$(choose_icon right $n) +C"
	echo -n "+|R $(recording_section) "
	echo -n "$(choose_bgcolor normal $n) $(date +%A) "
	echo -n "+@fn=1;$(choose_bgcolor invert $n) $(date +%F) +@fn=0;"
	echo "$(choose_bgcolor normal $n) $(date +%H:%M)"

	sleep 1
done

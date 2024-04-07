#!/bin/bash

notify()
{
	if   [ $1 -gt 60 ]
	then
		icon="🔊"

	elif [ $1 -gt 30 ]
	then
		icon="🔉"

	elif [ $1 -gt 0  ]
	then
		icon="🔈"
	else
		icon="🔇"
	fi

	dunstify -h int:value:$1 -h string:x-dunst-stack-tag:volume "$icon Volume:"
}

case $1 in
	mute )
		pamixer -m
		notify 0
		exit 0
	;;
	up   ) option='-i' ;;
	down ) option='-d' ;;
esac

pamixer -u
pamixer $option 5
notify `pamixer --get-volume`


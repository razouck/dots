#!/usr/bin/env bash
#
#
#                                              .o8   o8o
#                                             "888   `"'
#            ooo. .oo.  .oo.    .ooooo.   .oooo888  oooo   .oooo.
#            `888P"Y88bP"Y88b  d88' `88b d88' `888  `888  `P  )88b
#             888   888   888  888ooo888 888   888   888   .oP"888
#             888   888   888  888    .o 888   888   888  d8(  888
#            o888o o888o o888o `Y8bod8P' `Y8bod88P" o888o `Y888""8o
#
#--------------------------------------------------------------------------------
#--------------------------------------------------------------------------------
#--------------------------------------------------------------------------------
# TODO: Add support for Audacious.

thumbnail_path=/tmp/cOvEr.jpg
controlfile_prefix=/tmp/MeDiA_

rm -f $thumbnail_path
rm -f $controlfile_prefix*

[ -z $(pgrep mpd) ] && mpd

format="file>%file%\nartist>%artist%\ntitle>%title%\nalbum>%album%\ndate>%date%\n"
info="mpc -f $format"

case $1 in
stop) exit 0 ;;
pause)
	mpc $1
	exit 0
	;;
next | prev | play | toggle)

	dunstctl close
	info=$($info $1)
	;;
*)
	info=$($info)
	;;
esac

#--------------------------------------------------------------------------------
#---------------------------------- Functions -----------------------------------
#--------------------------------------------------------------------------------
function notify() {
	# TODO:
	# Have this function not use global variables. It is confusing as hell.
	# $artist, $title, $album, $year, $duration, $thumbnail_path
	# $current_progress_seconds, # $percentage, $number

	#  The information below can be taken directly from `mpc status`, but I
	#+ purposefully avoid calling mpc many times, as it may cause mpd to fail.
	current_progress_seconds=$(($(to_seconds $current_progress) + $1))
	duration_seconds=$(to_seconds $duration)
	progress=$(from_seconds $current_progress_seconds)
	percentage=$(get_percentage $current_progress_seconds $duration_seconds)
	progress=$progress/$duration
	(($duration_seconds < 3600)) && progress=${progress:3}

	#  The `-t 1050` is there to create the illusion this whole script creates
	#+ only one notification bubble each time it's called.
	dunstify -t 1050 -h string:x-dunst-stack-tag:music \
		-i $thumbnail -h int:value:$percentage \
		"$artist" \
		"<b>$title</b>\n<span size=\"medium\">${album}$year</span>\n$progress"
}

function print_info() {
	# TODO: Have this function not use fucking global variables.
	echo
	echo "Filename  $filename"
	echo "Title     $title"
	echo "Artist    $artist"
	echo "Album     $album"
	echo "Year      $year"
	echo "Duration  $duration"
	echo "Progress  $current_progress"
	echo "Stauts    $is_playing"
	echo
}

# Helper functions --------------------------------------------------------------
function cool_rng() {
	echo $(($RANDOM % 999999 + 100000))
}

function from_seconds() {
	n=$1
	h=$(($n / 3600))
	n=$(($n - 3600 * $h))
	m=$(($n / 60))
	n=$(($n - 60 * $m))
	s=$n

	echo "$(pad_n $h):$(pad_n $m):$(pad_n $s)"
}

function get_info() {
	#TODO: Alter this function so I don't have to create more global variables
	# than is needed.
	echo "$info" | grep $1 | awk -F '>' '{print $2}'
}

function get_percentage() {
	n=$(echo "scale=2; $1/$2" | bc)
	echo ${n/./}
}

function pad_n() {
	echo $(printf "%02d" $1)
}

function to_seconds() {
	arr=(${1//:/ })
	seconds=0

	for ((i = 0; i < ${#arr[@]}; i++)); do
		n=$(($i + 1))
		e=${arr[-$n]}
		s=$(echo "$e * 60 ^ $i" | bc)
		seconds=$(($seconds + $s))
	done

	echo $seconds
}

#--------------------------------------------------------------------------------
#------------------------------------- Data -------------------------------------
#--------------------------------------------------------------------------------
# Gets the state of playback.
line=$(echo "$info" | grep -E "(playing|paused)")
time_field=$(echo $line | awk '{print $3}')

# Sets fallback information.
unknown="Desconhecido"
unknown_icon="/usr/share/icons/Arc/devices/96/audio-speakers.png"
# TODO: chose another icon.

# Sets the path of the current file being played.
music_folder=$(xdg-user-dir MUSIC)
relpath=$(get_info file)
abspath=$music_folder/$relpath

# Gets the thumbnail picture. Alternative to`mpc readpicture <uri>`.
ffmpeg -i "$abspath" $thumbnail_path -v -8
thumbnail=$unknown_icon
[ -e $thumbnail_path ] && thumbnail=$thumbnail_path
controlfile=${controlfile_prefix}$(cool_rng)

# Gets the info we're after.
filename=$(echo $relpath | tr '/' '\n' | tail -n 1)
artist=$(get_info artist)
[ -z "$artist" ] && artist=$unknown
title=$(get_info title)
[ -z "$title" ] && title=$filename
album=$(get_info album)
[ -z "$album" ] && album=$unknown
year=$(get_info date)
[ -z "$year" ] && year="" || year=" (${year:0:4})"
duration=$(echo $time_field | cut -d "/" -f 2)
current_progress=$(echo $time_field | cut -d "/" -f 1)
is_playing=$(echo $line | awk '{print $1}')
is_playing=${is_playing:1:(-1)}

#--------------------------------------------------------------------------------
#------------------------------------- Loop -------------------------------------
#--------------------------------------------------------------------------------
[ $is_playing == "paused" ] && exit 0
# ^ This is so there's no notification when the music is simply paused.

touch $controlfile
# TODO: explain to myself why is this a thing.

print_info

for i in {1..4}; do
	if [ -e $controlfile ]; then
		notify $i
		sleep 1
	fi
done

# TODO:
# Let the user chose how many seconds the notification should stay on.
# I don't know how to fucking do that.
# This loop might be fucking unecessary.

#!/bin/bash

DIR=$HOME/Vídeos/screencasts
DATE=`date +%F_%H.%M.%S`



start_recording()
{
	ffmpeg -video_size 1920x1080 -framerate 30 \
	-f x11grab -i :0.0 -c:v libx264rgb -crf 0 -preset ultrafast -color_range 2 \
	$DIR/$DATE.mkv
}

stop_recording()
{
	PID=`ps -e | pgrep ffmpeg`
	kill -INT $PID
}



LOG=/tmp/recording

if [[ -e $LOG  ]]
then
	stop_recording
	rm $LOG
else
	start_recording > $LOG
fi


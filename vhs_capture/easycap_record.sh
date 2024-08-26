#!/bin/bash

TIMESTAMP=`date +%Y-%m-%d_%H-%M-%S`

ffmpeg -thread_queue_size 512 -f v4l2 -standard NTSC \
	-i /dev/video1 \
	-f alsa \
	-i hw:2,0 \
	-acodec libmp3lame \
	-b:a 128k \
	-channels 2 \
	-ar 48000 \
	-vcodec libx264 \
	-preset superfast \
	-crf 25 \
	-s 640x480 \
	-aspect 4:3 \
	easycap_${TIMESTAMP}.avi

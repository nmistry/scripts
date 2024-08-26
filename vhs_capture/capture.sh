#!/bin/bash

ffmpeg \
  -vaapi_device /dev/dri/renderD128 \
  -f v4l2 -standard NTSC -thread_queue_size 2048 -i /dev/video1 \
  -f alsa -thread_queue_size 2048 -i hw:2,0  \
  -vf 'hwupload,scale_vaapi=w=640:h=480:format=nv12' -c:v hevc_vaapi -qp 25 \
  -acodec libmp3lame -b:a 128k -channels 2 -ar 48000 \
  -t ${1:-0}:00:00 \
  VHS_Capture-$(date +%F_%H-%M-%S).mkv

# -vcodec libx264 -preset medium -crf 23 -s 640x480 -aspect 4:3 \

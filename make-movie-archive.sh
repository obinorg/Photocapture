#!/bin/sh
# Make a movie from archive of photos for web
# on the end is pused trigger from web interfase. 
# Than tutturu is coping file to web location, 
# compressing or making torrent file.
# 

dump=/home/user/dump
imgtempdir=/var/www/tutturu/sites/default/files/temp/images
videotempdir=/var/www/tutturu/sites/default/files/temp/video
# endday variable is set for dir in temp memory (aprox half ram):
endday=/dev/shm/temp-image
fname=`date +%Hh-%M-%d-%b-%Y`
dirname=`date +%d-%b-%Y`
# a day to process right now:
dayfile=14-Oct-2009
webcamdir=/var/www/tutturu/sites/default/files/webcam
videoinput=/var/www/tutturu/sites/default/files/autovideo-input

# clean memory
rm $endday/*
logger -t tutturu "copy images from input dir into temp"
# copy images from render dir into temp dir
cp ~/nas/render/1280x1024-secu-$dayfile*.jpg $endday/
cp ~/nas/render/1280x1024-prim-$dayfile*.jpg $endday/
logger "copied"
logger "making mp4 movie"
cd $endday
# below command is broken, its doing avi not mp4 
# but any way works in vlc and ffmpeg
mencoder "mf://*.jpg" -mf fps=25 -o $endday/$dayfile.mp4 -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=2500
cp $endday/$dayfile.mp4 $videoinput/$dayfile.mp4
logger "copied into $videoinput/$dayfile.mp4"
# not working on pisuar now becouse cookie is loged off 
# (remember not to share the cookie file)
curl --cookie cookies.txt --cookie-jar cookies.txt http://fabryka.obin.org/tutturu/admin/build/media_mover/config/4/run
logger "finish making movie $endday/$dayfile.mp4"
rm $endday/*
logger "deleted photos"
# make some noize
beep -f 1000
	  

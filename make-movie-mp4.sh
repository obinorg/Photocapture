#!/bin/sh
# make a movie every h and overide the temps
dump=/home/user/dump
imgtempdir=/var/www/tutturu/sites/default/files/temp/images
videotempdir=/var/www/tutturu/sites/default/files/temp/video
fname=`date +%Hh-%M-%d-%b-%Y`
dirname=`date +%d-%b-%Y`
webcamdir=/var/www/tutturu/sites/default/files/webcam

logger -t tutturu "copy images from working dir into temp"
cp ~/image-input-secu/$dirname/1280x1024/*.jpg $imgtempdir/
cp ~/image-input/$dirname/1280x1024/*.jpg $imgtempdir/
logger "copied"
logger "making mp4 movie"
cd $imgtempdir
nice -5 mencoder "mf://*.jpg" -mf fps=25 -o $videotempdir/$fname.mp4 -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=2500
logger "finish making movie $fname.mp4"
logger "start of making ogv videobin"
nice -5 ffmpeg2theora $videotempdir/$fname.mp4 -p videobin --optimize -o $videotempdir/$fname-videobin.ogv --title Fabric_exposed --location Torun_Poland --artist Szczym --date 01-Oct-2009 --license CC-by --contact szczym@obin.org --organization CSW-torun
logger "made movie $fname.ogv, coping to webcam/today-pro.ogv"
cp $videotempdir/$fname-videobin.ogv $webcamdir/today-videobin.ogv
logger "copied"
rm $videotempdir/$fname-videobin.ogv
logger "removed"
logger "start of making ogv preview"
nice -5 ffmpeg2theora $videotempdir/$fname.mp4 -p preview --optimize -o $videotempdir/$fname-preview.ogv --title Fabric_exposed --location Torun_Poland --artist Szczym --date 01-Oct-2009 --license CC-by --contact szczym@obin.org --organization CSW-torun
logger "made movie $fname-prevew.ogv, coping"
cp $videotempdir/$fname-preview.ogv $webcamdir/today-preview.ogv
logger "copied"
rm $videotempdir/$fname-preview.ogv
logger "start of making flv"
nice -5 ffmpeg -i $videotempdir/$fname.mp4 -acodec mp3 -ar 22050 -ab 64k -vcodec flv -s 480x360 -b 700k -r 25 $videotempdir/$fname.flv
logger "made movie $fname.flv, coping"
cp $videotempdir/$fname.flv $webcamdir/today.flv
logger "finished movies now delete"
rm $videotempdir/$fname.flv
rm $imgtempdir/*.jpg
rm $videotempdir/$fname.mp4
logger "deleted photos"
beep -f 1000
 
	  

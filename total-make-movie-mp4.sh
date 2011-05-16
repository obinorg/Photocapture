#!/bin/sh
# Make a total movie out of all photos in totaltempdir
dump=/home/user/dump
imgtempdir=/var/www/tutturu/sites/default/files/temp/images
videotempdir=/dev/shm/total-video
totaltempdir=/home/user/nas/render
fname=`date +%Hh-%M-%d-%b-%Y`
dirname=`date +%d-%b-%Y`
webcamdir=/var/www/tutturu/sites/default/files/webcam

logger -t tutturu "copy images from working dir into temp time is $fname"
cp ~/image-input/$dirname/1280x1024/*.jpg $totaltempdir/
cp ~/image-input-secu/$dirname/1280x1024/*.jpg $totaltempdir/
logger "copied"
logger "making total mp4 movie"
cd $totaltempdir
nice -5 mencoder "mf://*.jpg" -mf fps=25 -o $videotempdir/total-$fname.mp4 -ovc lavc -lavcopts vcodec=libx264:vbitrate=3000
logger "finished making movie total-$fname.mp4"
cp $videotempdir/total-$fname.mp4 $webcamdir/total-today.mp4
logger "start of making ogv preview"
nice -5 ffmpeg2theora $videotempdir/total-$fname.mp4 -p preview --optimize -o $videotempdir/total-$fname-preview.ogv --title Fabric_exposed --location Torun_Poland --artist Szczym --date 01-Oct-2009 --license CC-by --contact szczym@obin.org --organization CSW-torun
logger "made movie $fname-prevew.ogv, coping"
cp $videotempdir/total-$fname-preview.ogv $webcamdir/total-preview.ogv
logger "copied"
rm $videotempdir/total-$fname-preview.ogv
logger "start of making ogv videobin"
nice -5 ffmpeg2theora $videotempdir/total-$fname.mp4 -p pro --optimize -o $videotempdir/total-$fname-pro.ogv --title Fabric_exposed --location Torun_Poland --artist Szczym --date 01-Oct-2009 --license CC-by --contact szczym@obin.org --organization CSW-torun
logger "made movie $fname.ogv, coping to webcam/today-pro.ogv"
cp $videotempdir/total-$fname-pro.ogv $webcamdir/total-pro.ogv
logger "copied"
rm $videotempdir/total-$fname-pro.ogv
logger "removed"
logger "start of making flv"
nice -5 ffmpeg -i $videotempdir/total-$fname.mp4 -acodec mp3 -ar 22050 -ab 64k -vcodec flv -s 480x360 -b 500k -r 25 $videotempdir/total-$fname.flv
logger "made movie $fname.flv, coping"
cp $videotempdir/total-$fname.flv $webcamdir/total-today.flv
logger "finished movies now delete"
rm $videotempdir/total-$fname.flv
# rm $totaltempdir/*.jpg
rm $videotempdir/total-$fname.mp4
logger "deleted photos"
# make some noize
beep -f 3000
 
	  

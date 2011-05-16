#!/bin/sh
# a script to import a file from storage location and dump-it to dir 
# from where web interfase imports photos to cms. 
# In torun its run every 30 minutes.
dump=/home/user/dump
TEMP="/home/user/webcam"

RAWFILE="/home/user/webcam/raw.jpg"
RESIZEDFILE="/home/user/webcam/1024x768-resized.jpg"
STAMPEDFILE="/home/user/webcam/1024x768-stamped.jpg"
UPLOADFILE="/home/user/image-input/$DATESTRING.jpg"
dirname=`date +%d-%b-%Y`
i=`ls /home/user/image-input/$dirname/prim-* |tail -1 |awk -F/ '{print $NF}'`
logger "staring"


logger "coping from storage into folder for cms pick-up"
cp /home/user/image-input/$dirname/$i /var/www/tutturu/sites/default/files/image-www-pickup/$i
logger "runing trigler for cms pick-up"
# not working on pisuar now becouse cookie is loged off
# (remember not to share the cookie file)
curl --cookie cookies.txt --cookie-jar cookies.txt http://url-for-cms-puckup-trigger
# make some noize
beep -f 100
beep -f 100

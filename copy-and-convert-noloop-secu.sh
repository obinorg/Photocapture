#!/bin/sh
# copy photos from dump dir into storage location 2 times with a brake
# in torun that script is run every 1 minute
# variable for camera called secundo, secu
dump=/home/user/dump-secundo
TEMP="/home/user/webcam"

RAWFILE="/home/user/webcam/raw-secu.jpg"
RESIZEDFILE="/home/user/webcam/1024x768-resized-secu.jpg"
STAMPEDFILE="/home/user/webcam/1024x768-stamped-secu.jpg"
UPLOADFILE="/home/user/image-input/$DATESTRING.jpg"

for t in 1 2
do
echo "start of sequence" 
echo "time now is $timenow"
dirname=`date +%d-%b-%Y`
timenow=`date`

mkdir /home/user/image-input-secu/$dirname
mkdir /home/user/image-input-secu/$dirname/1280x1024
mkdir /home/user/image-input-secu/$dirname/640x480
mkdir /home/user/image-input-secu/$dirname/490x327
mkdir /home/user/image-input-secu/$dirname/320x240
mkdir /home/user/image-input-secu/$dirname/128x96

i=`ls /home/user/dump-secundo/* |tail -1 |awk -F/ '{print $NF}'`

pisuartime=`date +%d-%b-%Y-%H-%M-%S`
DATESTRING=`date +%l:%M%P\ \ %A,\ %d\ %B\ %Y`
	echo "time now is $timenow"
	echo "found $i, now wait 5 sec"
	sleep 5 # wait 5 sec for finish of copy from dump
	cp $dump/$i /home/user/image-input-secu/$dirname/ 
	echo "time now is $timenow"
	echo "copied to image-input/$dirname/$i"
	cp $dump/$i /home/user/webcam/raw-secu.jpg
	echo "time now is $timenow"
	echo "copied to raw-secu.jpg"
	  convert -resize 1280x1024 $dump/$i /home/user/image-input-secu/$dirname/1280x1024/1280x1024-$i
	  cp /home/user/image-input-secu/$dirname/1280x1024/1280x1024-$i /home/user/webcam/1280x1024-resized-secu.jpg
	  cp /home/user/image-input-secu/$dirname/1280x1024/1280x1024-$i /home/user/webcam/1280x1024-stamped-secu.jpg
	  echo "time now is $timenow"
	  echo "converted into /home/user/image-input-secu/$dirname/1280x1024/1280x1024-$i "
	  convert -resize 640x480 $dump/$i /home/user/image-input-secu/$dirname/640x480/640x480-$i
	  cp /home/user/image-input-secu/$dirname/640x480/640x480-$i /home/user/webcam/640x480-resized-secu.jpg
	  cp /home/user/image-input-secu/$dirname/640x480/640x480-$i /home/user/webcam/640x480-stamped-secu.jpg	  
	  convert -resize 490x327 $dump/$i /home/user/image-input-secu/$dirname/490x327/490x327-$i
	  cp /home/user/image-input-secu/$dirname/490x327/490x327-$i /home/user/webcam/490x327-resized-secu.jpg	  
	  cp /home/user/image-input-secu/$dirname/490x327/490x327-$i /home/user/webcam/490x327-stamped-secu.jpg	  
	  echo "time now is $timenow"
	  echo "now beep"
	  # make some noize
 beep -f 600
echo "did the beep"
	  echo "time now is $timenow"
rm $dump/$i
echo "deleted $i"


echo "time now is $timenow"
echo "wait 20 sec and start over"
sleep 20 # wait for 20 sec
 done

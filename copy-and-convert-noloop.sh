#!/bin/sh
# copy the shit from dump
# to the local
dump=/home/user/dump
TEMP="/home/user/webcam"

RAWFILE="/home/user/webcam/raw.jpg"
RESIZEDFILE="/home/user/webcam/1024x768-resized.jpg"
STAMPEDFILE="/home/user/webcam/1024x768-stamped.jpg"
UPLOADFILE="/home/user/image-input/$DATESTRING.jpg"

for t in 1 2
do
echo "start of sequence" 
echo "time now is $timenow"
dirname=`date +%d-%b-%Y`
timenow=`date`

mkdir /home/user/image-input/$dirname
mkdir /home/user/image-input/$dirname/1280x1024
mkdir /home/user/image-input/$dirname/640x480
mkdir /home/user/image-input/$dirname/490x327
mkdir /home/user/image-input/$dirname/320x240
mkdir /home/user/image-input/$dirname/128x96

i=`ls /home/user/dump/* |tail -1 |awk -F/ '{print $NF}'`

pisuartime=`date +%d-%b-%Y-%H-%M-%S`
DATESTRING=`date +%l:%M%P\ \ %A,\ %d\ %B\ %Y`
	echo "time now is $timenow"
	echo "found $i, now wait 10 sec"
	sleep 10 # wait 10 sec for finish of copy from dump
	cp $dump/$i /home/user/image-input/$dirname/ 
	echo "time now is $timenow"
	echo "copied to image-input/$dirname/$i"
	cp $dump/$i /home/user/webcam/raw.jpg
	echo "time now is $timenow"
	echo "copied to raw.jpg"
	  convert -resize 1280x1024 $dump/$i /home/user/image-input/$dirname/1280x1024/1280x1024-$i
	  cp /home/user/image-input/$dirname/1280x1024/1280x1024-$i /home/user/webcam/1280x1024-resized.jpg
	  cp /home/user/image-input/$dirname/1280x1024/1280x1024-$i /home/user/webcam/1280x1024-stamped.jpg
	  echo "time now is $timenow"
	  echo "converted into /home/user/image-input/$dirname/1280x1024/1280x1024-$i "
	  convert -resize 640x480 $dump/$i /home/user/image-input/$dirname/640x480/640x480-$i
	  cp /home/user/image-input/$dirname/640x480/640x480-$i /home/user/webcam/640x480-resized.jpg
	  cp /home/user/image-input/$dirname/640x480/640x480-$i /home/user/webcam/640x480-stamped.jpg	  
	  convert -resize 490x327 $dump/$i /home/user/image-input/$dirname/490x327/490x327-$i
	  cp /home/user/image-input/$dirname/490x327/490x327-$i /home/user/webcam/490x327-resized.jpg	  
	  cp /home/user/image-input/$dirname/490x327/490x327-$i /home/user/webcam/490x327-stamped.jpg	  
	  echo "time now is $timenow"
	  echo "now beep"
 beep -f 600
echo "did the beep"
#~ echo "...converting image for the web"
#~ convert -resize 1024x768 $RAWFILE $RESIZEDFILE
#~ convert -fill "#333333" -draw "rectangle 0,722 1024,768" $RESIZEDFILE $STAMPEDFILE
#~ convert -fill "#eeeeee" -draw "rectangle 0,723 1024,768" $STAMPEDFILE $STAMPEDFILE
#~ convert -font "Helvetica" -pointsize 28 -fill "#111111" -draw "text 25, 755 '$DATESTRING'" $STAMPEDFILE $STAMPEDFILE 
#~ echo "converted"
	  echo "time now is $timenow"
rm $dump/$i
echo "deleted $i"


echo "time now is $timenow"
echo "wait 20 sec and start over"
  sleep 20 # wait for 20 sec
 done

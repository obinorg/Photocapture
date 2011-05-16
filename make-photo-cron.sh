#!/bin/sh
# Script for taking photos every minute
# caled from cron 
# with the prim file name variable
# based on example from capture
#
timenowloop2=`date +%d-%b-%Y-%H-%M-%S`
logger "start of $i loop time now is $timenowloop2"
fnamedate=`date +%d-%b-%Y-%H-%M-%S`
logger "making photo prim-$fnamedate.jpg"
/home/user/capture 'start'
/home/user/capture 'flash off'
/home/user/capture 'zoom 1'
/home/user/capture 'metering spot'
/home/user/capture 'focuspoint center'
/home/user/capture 'size medium1'
/home/user/capture 'qual superfine'
/home/user/capture 'capture /home/user/raw/raw.jpg'
mv /home/user/raw/raw.jpg /home/user/raw/prim-$fnamedate.jpg
chown photocapture:photocapture /home/user/raw/prim-$fnamedate.jpg
mv /home/user/raw/prim-$fnamedate.jpg /home/user/dump/prim-$fnamedate.jpg
logger "sending to pisuar server /home/user/dump/prim-$fnamedate.jpg"
scp -i /home/user/.ssh/photocapture-pisuar /home/user/dump/prim-$fnamedate.jpg user@example-server:/home/user/dump
# here need logic was it send or not
logger "sent, now delete"
rm /home/user/dump/prim-$fnamedate.jpg
# logger "now sleep for 50 sec"
# sleep 50
timenowloop=`date +%d-%b-%Y-%H-%M-%S`
# logger "end of $i loop time is $timenowloop"
# done
logger "end of total loop, will exit"
# camera makes quit every 20 minutes, its called via quit-camera.sh script
# if you need to quit strait after taking photos, uncoment below
# /home/user/capture 'quit'
timenow=`date +%d-%b-%Y-%H-%M-%S`
logger "time now is $timenow exiting"


# Example of scripting capabilities of capture.
#

#~ capture 'start'
#~ capture 'flash off'
#~ capture 'zoom 1'
#~ capture 'metering spot'
#~ capture 'focuspoint center'
#~ capture 'capture test.jpg'
#~ sleep 10

#!/bin/sh

# /usr/bin/ptpcam -r
# for i in 1 2 3 4 5 6 7 8 
# do

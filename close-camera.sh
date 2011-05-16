#!/bin/sh
# Script for closing camera 20 cecounds after the start of cron, 
# so that normal make-photo script might do the job
# in torun its running every 20 minutes
sleep 20
timenow='date'
logger "quiting camera, time is $date"
/home/user/capture 'quit'
logger "commad issued, time is $date"
logger "hasta-la-vista fabric"
logger "now beep"
# make some noize
beep -f 600
logger "did the beep"


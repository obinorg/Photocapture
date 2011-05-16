Package photocapture is set of scripts that makes photos and than makes movies out of that, 
and publish on web via drupal cms.

Schema of the process is:

1 via cron every 1 minute make-photo-cron.sh
(On some systems it have to be run as sudo due to issues with capture binary)
- make photo 
- copy photo to file name with date
2 via cron every 1 minute copy-and-convert-noloop.sh 
- make dirs at storage location
- copy photo to storage location
- convert photo to other sizes 
- copy photo to webcam temp name
3 via cron every 20 minutes quit-camera.sh
(On some systems it have to be run as sudo due to issues with capture binary)
- quit and close photo camera via usb
4 via cron every 30 minutes make-movie-mp4.sh
- copy todays photos to temp dir 
- make mp4 via mencoder
- repeat with ogv and flv
- copy files into webcam files
- remove temps
5 via cron every 30 minutes move-photo-for-web.sh
- moves photo for web
- triggers cms import into photo-archive
6 via cron every day at 23:05 (after making photos) total-make-movie-mp4.sh
- make mp4 movie from temp images
- triggers cms import into video-archive


For installation information look into INSTALL.txt

Code is located on launchpad at
https://code.launchpad.net/~szczym/tutturu/photocapture

Working example at 
http://fabryka.obin.org/tutturu/

yes, all is on GNU

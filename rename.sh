#!/bin/sh
# dirty hack to rename files in big directory. 
# in below example every file name like 1280x1024-prim-30*.jpg 
# will have string prim swaped for aprim

workdir=/media/hd-nas/fabryka/render

for input in `ls $workdir/1280x1024-prim-30*.jpg`; do
echo "$input"
newname=`echo $input | sed 's/prim/aprim/g'`;
mv -v -i "$input" "$newname"
done




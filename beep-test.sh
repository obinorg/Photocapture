#!/bin/sh
# just to test some noize
# one below is like stupid mobile phone
# best are short ones imho
while [ 1 ]; do
echo "now"
beep -f 1000
sleep 1
beep -f 2000
sleep 2
beep -f 1000 -n -f 2000 -n -f 1000 -n -f 2000 -n -f 1000 -n -f 1500 -n -f 1000 -n -f 1500 -n -f 1000 -n -f 1000 -n -f 1000
sleep 3
done

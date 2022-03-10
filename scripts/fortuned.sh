#!/bin/bash
#loop forever
while :
do
# create a file with a fortune in it
/usr/games/fortune > /home/linuxuser/fortune
# sleep for 30 seconds
sleep 30
# wakeup send fortune to all users
wall -n /home/linuxuser/fortune
done

#!/bin/bash
#loop forever
while :
do
# sleep for 30 seconds
sleep 30
# wakeup send fortune to all users
echo -e " "
echo -e " "
echo -n "`/usr/games/fortune`"
echo -e " "
echo -e " "
done

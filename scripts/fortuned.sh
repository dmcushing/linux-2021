#!/bin/sh
#loop forever
while :
do
# sleep for 30 seconds
sleep 30
# wakeup send fortune to all users
fortune | wall
done

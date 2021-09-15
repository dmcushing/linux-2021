#!/bin/sh
#loop forever
while :
do        
    # now sleep for 30 seconds       
    sleep 30       
    # after wakeup send message to all users       
    wall <<EOF               
Ok people! Time to take a break before               
you get carpal tunnel syndrome!
EOF
done

#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Cleaning up..."
umount /dev/sde1 2>/dev/null
sgdisk --zap-all /dev/sde 2>/dev/null
userdel -r quiz7 2>/dev/null
rm -Rf /home/linuxuser/Quiz07
echo -e "Done clean up."
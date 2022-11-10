#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
userdel -r quiz06 2>/dev/null
rm -Rf /home/linuxuser/Quiz06
mkdir /home/linuxuser/Quiz06
chown linuxuser:linuxuser /home/linuxuser/Quiz06
echo -e "Done setting up."
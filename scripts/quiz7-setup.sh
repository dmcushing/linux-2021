#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
userdel -r quiz7 2>/dev/null
rm -Rf /home/linuxuser/Quiz7
mkdir /home/linuxuser/Quiz7
chown linuxuser:linuxuser /home/linuxuser/Quiz7
echo -e "Done setting up."
#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
userdel -r quiz6 2>/dev/null
rm -Rf /home/linuxuser/Quiz6
mkdir /home/linuxuser/Quiz6
chown linuxuser:linuxuser /home/linuxuser/Quiz6
echo -e "Done setting up."
#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Cleaning up..."
sudo apt purge -y cowsay figlet
userdel -r quiz06 2>/dev/null
rm -Rf /home/linuxuser/Quiz06
echo -e "Done cleaning up."
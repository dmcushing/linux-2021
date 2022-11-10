#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Cleaning up..."
sudo apt purge -y cowsay figlet
userdel -r quiz6 2>/dev/null
rm -Rf /home/linuxuser/Quiz6
echo -e "Done cleaning up."
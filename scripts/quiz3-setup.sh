#!/bin/bash
# Set Up for Postal Codes Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
useradd -m -s /bin/bash quiz3 2>/dev/null
groupadd quiz3 2>/dev/null
rm -Rf /home/linuxuser/Quiz3
mkdir /home/linuxuser/Quiz3
chown linuxuser:linuxuser /home/linuxuser/Quiz3
echo -e "Done setting up."
#!/bin/bash
# Set Up for Postal Codes Quiz II
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
useradd -m -s /bin/bash quiz03 2>/dev/null
groupadd quiz03 2>/dev/null
rm -Rf /home/linuxuser/Quiz03
mkdir /home/linuxuser/Quiz03
chown linuxuser:linuxuser /home/linuxuser/Quiz03
echo -e "Done setting up."
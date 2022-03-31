#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
# apt -y install xinetd telnet telnetd fortune 2>&1>/dev/null
rm -Rf /home/linuxuser/Quiz08
mkdir /home/linuxuser/Quiz08
chown linuxuser:linuxuser /home/linuxuser/Quiz08
chmod 775 /home/linuxuser/Quiz08
sgdisk --zap-all /dev/sdb 
sgdisk --zap-all /dev/sdc 
sgdisk --zap-all /dev/sdd
echo -e "Done setting up."
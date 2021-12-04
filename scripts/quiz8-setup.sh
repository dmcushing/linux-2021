#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
# apt -y install xinetd telnet telnetd fortune 2>&1>/dev/null
rm -Rf /home/linuxuser/Quiz08
mkdir /home/linuxuser/Quiz08
mkdir -p /etc/xinetd.d 2>&1>/dev/null
chown linuxuser:linuxuser /home/linuxuser/Quiz08
chmod 775 /home/linuxuser/Quiz08
cp -f /scripts/fortune /etc/xinetd.d/
cp -f /scripts/fortune.sh /etc/xinetd.d/
chmod 755 /etc/xinetd.d/fortune.sh
echo -e "Done setting up."
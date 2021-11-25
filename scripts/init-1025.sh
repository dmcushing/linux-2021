#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
useradd -m -s /bin/bash linuxuser
chmod 660 /etc/sudoers
echo "linuxuser ALL=(ALL:ALL) ALL" >> /etc/sudoers
chmod 440 /etc/sudoers
echo "linuxuser:cetystudent" | chpasswd
apt -y update
sleep 30
apt -y install tree
echo -e "Init script... completed!"
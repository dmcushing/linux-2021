!#/bin/bash
clear
useradd -m -s /bin/bash linuxuser
chmod 660 /etc/sudoers
echo "linuxuser ALL=(ALL:ALL) ALL" >> /etc/sudoers
chmod 440 /etc/sudoers
echo "linuxuser:cetystudent" | chpasswd
echo "Init script... completed!"
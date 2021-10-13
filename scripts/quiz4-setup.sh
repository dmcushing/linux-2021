#!/bin/bash
# Set Up for Archiving Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
useradd -m -s /bin/bash quiz4
groupadd quiz4
rm -Rf /home/linuxuser/Quiz4
mkdir /home/linuxuser/Quiz4
chown linuxuser:linuxuser /home/linuxuser/Quiz4
echo -e "Done setting up."
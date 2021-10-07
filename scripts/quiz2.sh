#!/bin/bash
# Set Up for Tom Hanks Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
useradd -m -s /bin/bash tomhanks
groupadd toystory
groupadd 2020
groupadd 2019
rm -Rf /home/linuxuser/Quiz2
mkdir /home/linuxuser/Quiz2
chown linuxuser:linuxuser /home/linuxuser/Quiz2
echo -e "Done setting up."
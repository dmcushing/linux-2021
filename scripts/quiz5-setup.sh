#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
rm -Rf /home/linuxuser/Quiz5
mkdir /home/linuxuser/Quiz5
mkdir -p /home/linuxuser/Quiz5/basement/IT
mkdir -p /home/linuxuser/Quiz5/basement/office
chown linuxuser:linuxuser /home/linuxuser/Quiz5
echo -e "Done setting up."
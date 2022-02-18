#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
rm -Rf /home/linuxuser/Quiz05
mkdir /home/linuxuser/Quiz05
mkdir -p /home/linuxuser/Quiz05/basement/IT
mkdir -p /home/linuxuser/Quiz05/basement/office
chown -R linuxuser:linuxuser /home/linuxuser/Quiz05
echo -e "Done setting up."
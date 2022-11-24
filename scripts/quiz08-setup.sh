#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
rm -Rf ~/Quiz08
mkdir ~/Quiz08
chown linuxuser:linuxuser ~/Quiz08
chmod 775 ~/Quiz08
echo -e "Done setting up."
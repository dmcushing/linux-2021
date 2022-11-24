#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
rm -Rf ~/Quiz8
mkdir ~/Quiz8
chown linuxuser:linuxuser ~/Quiz8
chmod 775 ~/Quiz8
echo -e "Done setting up."
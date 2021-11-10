#!/bin/bash
# Software Packages

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
echo -e "Resetting..."
apt -y purge joe nudoku pacman4console
rm -Rf ~/software/
rm -Rf ~/hello-2.8
rm /usr/local/bin/hello
echo -e "Done!"

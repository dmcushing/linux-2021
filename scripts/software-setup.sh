#!/bin/bash
# Software Packages

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
echo -e "Resetting..."
apt -y purge joe nudoku pacman4console ninvaders moon-buggy alpine-pico
rm -Rf ~/software/
rm -Rf ~/hello-2.8
rm /usr/local/bin/hello
clear
echo -e "Done!"

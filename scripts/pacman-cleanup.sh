#!/bin/bash
# Pacman Cleanup

source /scripts/functions.sh
clear
is_super_user

echo -e "Cleaning up the ghosts!"
rm -Rf ~/Pacman ~/quarantine
echo -e "..Directories removed"
echo -e "...All Clean!"

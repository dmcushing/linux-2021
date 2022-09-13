#!/bin/bash
# Posta1 Cleanup

source /scripts/functions.sh
clear
is_super_user

echo -e "Cleaning up!"
rm -Rf ~/Postal
echo -e "..Directories removed"
echo -e "...All Clean!"

#!/bin/bash

# Fishing Clean Up Script

source /scripts/functions.sh
clear
is_super_user

echo -e "Cleaning out the fishing hole - ignore any errors below"
rm -Rf /home/linuxuser/Fishing

echo -e "....Squeaky clean once again!"

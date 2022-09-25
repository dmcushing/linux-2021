#!/bin/bash

# Fishing for grep Setup Script

source /scripts/functions.sh
clear
is_super_user

echo -e "Fishing for grep set up - ignore any errors below"
echo -e "..Hunting for worms"
rm -Rf ~/Fishing
mkdir ~/Fishing
cp /scripts/work/words ~/Fishing/
chown -R linuxuser:linuxuser ~/Fishing

echo -e "....All set\n\n So long and thanks for all the fish!"

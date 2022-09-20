#!/bin/bash

# Diagon Clean Up Script

source /scripts/functions.sh
clear
is_super_user

echo -e "Sending street cleaners to Diagon Alley - ignore any errors below"
rm -Rf /home/linuxuser/DiagonAlley
groupdel beasts &> /dev/null
groupdel potions &> /dev/null
groupdel spells &> /dev/null
groupdel lostfound  &> /dev/null
userdel -r beastuser &> /dev/null
userdel -r spelluser &> /dev/null
userdel -r potionuser &> /dev/null
userdel -r diagon &> /dev/null

echo -e "....Squeaky clean once again!"

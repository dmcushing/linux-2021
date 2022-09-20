#!/bin/bash

# Potter Setup Script

source /scripts/functions.sh
clear
is_super_user

echo -e "Come follow me to Diagon Alley - ignore any errors below"
echo -e "..spells and potions and wands for sorting"
rm -Rf /home/linuxuser/DiagonAlley
mkdir /home/linuxuser/DiagonAlley
chown -R linuxuser:linuxuser /home/linuxuser/DiagonAlley
groupdel beasts &> /dev/null
groupdel potions &> /dev/null
groupdel spells &> /dev/null
groupdel lostfound  &> /dev/null
groupadd beasts &> /dev/null
groupadd potions &> /dev/null
groupadd spells &> /dev/null
groupadd lostfound &> /dev/null
userdel -r beastuser &> /dev/null
userdel -r spelluser &> /dev/null
userdel -r potionuser &> /dev/null
useradd beastuser
useradd spelluser
useradd potionuser
useradd diagon

echo -e "....All set\n\n Time to sort things"

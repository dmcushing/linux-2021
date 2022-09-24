#!/bin/bash

# Potter Setup Script

source /scripts/functions.sh
clear
is_super_user

echo -e "Fishing for grep set up - ignore any errors below"
echo -e "..Hunting for worms"
rm -Rf ~/Fishing
mkdir ~/Fishing
cp /scripts/work/words ~/Fishing/
chown -R linuxuser:linuxuser ~/Fishing
groupdel rowling &> /dev/null
groupadd gryffindor  &> /dev/null
userdel -r harry &> /dev/null
useradd -G gryffindor,rowling -m -s /bin/bash harry

echo -e "....All set\n\n So long and thanks for all the fish!"

#!/bin/bash
# CLI Practice 1 - Cleanup Script

clear
echo -e "CLI practice set up - ignore any errors below"
if [[ $EUID -ne 0 ]]
then
        echo "Insufficient permissions. Run this script as root, or with sudo."
        exit 1
fi
rm -rf /home/linuxuser/Hogwarts
userdel -r harry
userdel -r hermione
userdel -r ron
userdel -r godric
userdel -r snapes
userdel -r lucius
userdel -r draco
userdel -r bryce
userdel -r burbidge
userdel -r bayliss
groupdel gryffindor
groupdel slytherin
groupdel muggles
groupdel rowling
clear
echo -e "All set..\n\n Time for quiddich"

#!/bin/bash
# Pacman

source /scripts/functions.sh
clear
is_super_user

echo -e "Resetting the zoo!"
rm -Rf ~/Madagascar
userdel -r alex 2>/dev/null
userdel -r marty 2>/dev/null
userdel -r melman 2>/dev/null
userdel -r gloria 2>/dev/null
userdel -r skipper 2>/dev/null
userdel -r private 2>/dev/null
userdel -r kowalski 2>/dev/null
userdel -r julien 2>/dev/null
userdel -r maurice 2>/dev/null
groupdel zoo 2>/dev/null
groupdel mammals 2>/dev/null
groupdel penguins 2>/dev/null
groupdel jungle 2>/dev/null
mkdir ~/Madagascar
chown -R linuxuser:linuxuser ~/Madagascar
echo -e "....Everything reset"
echo -e "......go chase the penguins!"

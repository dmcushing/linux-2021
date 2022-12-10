#!/bin/bash
source /scripts/functions.sh
clear
is_super_user

echo -e "Cleaning up..."
echo -e " Clean up users and groups.."

# Clean up old users
USERS=( "kirk" "spock" "mccoy" "uhura" "scotty" "sulu" "chekov" "chapel" )
for USERS in ${USERS[*]}
do
	userdel -r $USERS
done


# Clean up old groups
GRP=( "command" "bridge" "engine" "medical" "helm")
for GRP in ${GRP[*]}
do
	groupdel $GRP
done

echo -e " Clean up disks and directories.."

# Clean up Disks + Dirs
umount -a >/dev/null 2>&1
vgremove -y $( vgdisplay --colon | cut -f1 -d: ) >/dev/null 2>&1
pvremove -y $( pvdisplay -C -o pvname --noheadings | cut -f1 ) >/dev/null 2>&1
sgdisk --zap-all /dev/sdb >/dev/null 2>&1
sgdisk --zap-all /dev/sdc >/dev/null 2>&1
sgdisk --zap-all /dev/sdd >/dev/null 2>&1
sgdisk --zap-all /dev/sde >/dev/null 2>&1
sgdisk --zap-all /dev/sdf >/dev/null 2>&1
sgdisk --zap-all /dev/sdg >/dev/null 2>&1
sgdisk --zap-all /dev/sdh >/dev/null 2>&1
sgdisk --zap-all /dev/sdi >/dev/null 2>&1
rm -Rf /media/*
rm -Rf ~/startrek

echo -e " Clean up crontab.."
# Delete crontab entries
crontab -r  >/dev/null 2>&1

echo -e " Clean up software installs.."

echo -e "Done clean up."
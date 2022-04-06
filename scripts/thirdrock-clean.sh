#!/bin/bash
source /scripts/functions.sh
clear
is_super_user

echo -e "Cleaning up..."
echo -e " Clean up users and groups.."

# Clean up old users
USERS=( "dick" "sally" "harry" "tommy" "mary" "nina" "mamie" "don" )
for USERS in ${USERS[*]}
do
	sed -i /$USERS/d /etc/passwd
	sed -i /$USERS/d /etc/shadow
	rm -Rf /home/$USERS
done


# Clean up old groups
GRP=( "aliens" "humans" "security" "comm" "university" "dick" "sally" "harry" "tommy" "mary" "nina" "mamie" "don")
for GRP in ${GRP[*]}
do
	sed -i /$GRP/d /etc/group
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
rm -Rf ~/thirdrock

echo -e " Clean up crontab.."
# Delete crontab entries
crontab -r  >/dev/null 2>&1

echo -e " Clean up software installs.."
# remove iftop + calcurse
apt -y purge iftop calcurse  >/dev/null 2>&1

echo -e "Done clean up."
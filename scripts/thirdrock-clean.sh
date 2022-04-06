#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
echo "Cleaning up..."

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


# Delete crontab entries
crontab -r

# remove iftop + calcurse
apt -y purge iftop calcurse 2>&1>/dev/null

echo -e "Done clean up."
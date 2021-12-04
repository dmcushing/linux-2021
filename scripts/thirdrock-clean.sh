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
	rm -rf /home/$USERS
done


# Clean up old groups
GRP=( "aliens" "humans" "security" "comm" "university" "dick" "sally" "harry" "tommy" "mary" "nina" "mamie" "don")
for GRP in ${GRP[*]}
do
	sed -i /$GRP/d /etc/group
done

# Clean up Disks + Dirs
umount /dev/sdb1
umount /dev/sdb2
umount /dev/vg_practice/lv_practice
vgremove -ff vg_practice
pvremove -q -y /dev/sdc1 /dev/sdd1
rm -rf /media/tr-*
rm -rf ~/thirdrock


# Delete crontab entries
crontab -r >/dev/null

# Wipe all the disks
sgdisk --zap-all /dev/sdb
sgdisk --zap-all /dev/sdc
sgdisk --zap-all /dev/sdd


# remove iftop
apt -y purge iftop 2>&1>/dev/null

echo -e "Done clean up."
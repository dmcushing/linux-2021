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
umount /dev/sdb1 2>&1>/dev/null
umount /dev/sdb2 2>&1>/dev/null
umount /dev/vg_practice/lv_practice 2>&1>/dev/null
vgremove -ff vg_practice 2>&1>/dev/null
pvremove -q -y /dev/sdc1 /dev/sdd1 2>&1>/dev/null
rm -rf /media/tr-*
rm -rf ~/thirdrock


# Delete crontab entries
crontab -r

# Wipe all the disks
sgdisk --zap-all /dev/sdb 2>&1>/dev/null
sgdisk --zap-all /dev/sdc 2>&1>/dev/null
sgdisk --zap-all /dev/sdd 2>&1>/dev/null


# remove iftop
apt -y purge iftop 2>&1>/dev/null

echo -e "Done clean up."
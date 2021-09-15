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

# Clean up Third Rock
umount /dev/sdb1
umount /dev/sdb2
rm -rf /usr/local/thirdrock


# Delete crontab entries
crontab -r >/dev/null

# Wipe all the disks
dd if=/dev/zero of=/dev/sdb bs=512 count=1 >/dev/null
dd if=/dev/zero of=/dev/sdc bs=512 count=1 >/dev/null
dd if=/dev/zero of=/dev/sdd bs=512 count=1 >/dev/null
dd if=/dev/zero of=/dev/sde bs=512 count=1 >/dev/null

# Clean up fstab
sed -i /sdb/d /etc/fstab
sed -i /sdc/d /etc/fstab
sed -i /sdd/d /etc/fstab
sed -i /sde/d /etc/fstab
sed -i /assign/d /etc/fstab
sed -i /practice/d /etc/fstab


# remove iftop
apt -y remove iftop

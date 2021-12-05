#!/bin/bash
# FINAL Script to Gather Student Work
source /scripts/functions.sh

clear
is_super_user
student_info Third-Rock-Practice

echo -e "Question 1 - Users and Groups" | tee -a $outfile
GROUPID=("aliens" "university" "security" "comm" "humans")
for GROUPID in ${GROUPID[*]}
do
	entity_exists 1 $GROUPID group
	getent group $GROUPID | tee -a $outfile
blank_line
done
blank_line
USERID=("dick" "sally" "harry" "tommy")
for USERID in ${USERID[*]}
do
	entity_exists 1 $USERID passwd
	user_param 1 account_expiry $USERID 2021-06-01
done
USERID=("mary" "nina" "mamie" "don")
for USERID in ${USERID[*]}
do
	entity_exists 1 $USERID passwd
done
blank_line

echo -e "Question 2 - Create Directory Structure" | tee -a $outfile
blank_line
DIRECTORY=("/home/linuxuser/thirdrock" "/home/linuxuser/thirdrock/house" "/home/linuxuser/thirdrock/university" "/home/linuxuser/thirdrock/biggianthead" "/home/linuxuser/thirdrock/roof" "/media/tr-sdb1" "/media/tr-sdb2" "/media/tr-lvm")

for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 2 $DIRECTORY d
done
FILE=("/home/linuxuser/thirdrock/biggianthead/StonePhillips" )
for FILE in ${FILE[*]}
do
	check_existence 2 $FILE f
done
blank_line
echo -e "Question 3 - Filesystems"| tee -a $outfile
blank_line
check_existence 3 /dev/sdb1 b
check_part 3 is_mounted /dev/sdb1
check_part 3 mount_point /media/tr-sdb1 /dev/sdb1
check_part 3 fs_type /dev/sdb1 ext4
blank_line
check_existence 3 /dev/sdb2 b
check_part 3 is_mounted /dev/sdb2
check_part 3 mount_point /media/tr-sdb2 /dev/sdb2
check_part 3 fs_type /dev/sdb2 ext3
mount | grep 'sdb2' | tee -a $outfile
blank_line
check_existence 3 /dev/vg_practice/lv_practice b
check_part 3 is_mounted /dev/mapper/vg_practice-lv_practice
check_part 3 mount_point /media/tr-lvm /dev/mapper/vg_practice-lv_practice
check_part 3 fs_type /dev/mapper/vg_practice-lv_practice ext4
blank_line
lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/sdb1 /dev/sdb2 /dev/vg_starwars/lv_deathstar | tee -a $outfile
blank_line

echo -e "Question 4 - Permissions and Ownership"| tee -a $outfile
check_owner 4 /home/linuxuser/thirdrock dick
check_group 4 /home/linuxuser/thirdrock aliens
check_permissions 4 /home/linuxuser/thirdrock drwxrwxrwx
check_owner 4 /home/linuxuser/thirdrock/biggianthead dick
check_group 4 /home/linuxuser/thirdrock/biggianthead aliens
check_permissions 4 /home/linuxuser/thirdrock/biggianthead drwxrwx---
check_owner 4 /home/linuxuser/thirdrock/university dick
check_group 4 /home/linuxuser/thirdrock/university university
check_permissions 4 /home/linuxuser/thirdrock/university drwxrwx---
check_owner 4 /home/linuxuser/thirdrock/house mamie
check_permissions 4 /home/linuxuser/thirdrock/house drwxrwxrwx
check_owner 4 /home/linuxuser/thirdrock/biggianthead/StonePhillips harry
check_group 4 /home/linuxuser/thirdrock/biggianthead/StonePhillips aliens
check_permissions 4 /home/linuxuser/thirdrock/biggianthead/StonePhillips -rw-r-----
blank_line

echo -e "Question 5 - Find" | tee -a $outfile

check_existence 5 /home/linuxuser/thirdrock/fgain.txt f
check_line_count 5 ~/thirdrock/fgain.txt 4
tail -5 ~/thirdrock/fgain.txt | tee -a $outfile
blank_line

echo -e "Question 6 - Grep" | tee -a $outfile

check_existence 6 /home/linuxuser/thirdrock/firstlast.txt f
check_line_count 5 ~/thirdrock/firstlast.txt 4
tail -5 ~/thirdrock/firstlast.txt | tee -a $outfile
blank_line

echo -e "Question 7 - tar and cron" | tee -a $outfile

check_existence 7 ~/thirdrock.tar.gz f

crontab -l | tail -3 | tee -a $outfile
blank_line
echo -e "Question 8 - Installing Software" | tee -a $outfile
package_check 8 calcurse
dpkg --list calcurse | tee -a $outfile
package_check 8 iftop
blank_line

# Submit the work
mail_out Third-Rock-Practice
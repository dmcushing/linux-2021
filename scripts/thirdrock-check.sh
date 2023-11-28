#!/bin/bash
# FINAL Script to Gather Student Work
source /scripts/functions.sh

clear
is_super_user
student_info Third-Rock-Review

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
	user_param 1 account_expiry $USERID 2031-06-01
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
lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/sdb1 /dev/sdb2 /dev/vg_practice/lv_practice | tee -a $outfile
blank_line

echo -e "Question 4 - Permissions and Ownership"| tee -a $outfile
check_owner 4 /home/linuxuser/thirdrock linuxuser
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

check_existence 5 /home/linuxuser/thirdrock/trichoblast f
check_line_count 5 ~/thirdrock/trichoblast 50
tail -5 ~/thirdrock/trichoblast | tee -a $outfile
blank_line
check_existence 5 /home/linuxuser/thirdrock/fgain.txt f
check_line_count 5 ~/thirdrock/fgain.txt 4
tail -5 ~/thirdrock/fgain.txt | tee -a $outfile
blank_line

echo -e "Question 6 - Grep" | tee -a $outfile

check_existence 6 /home/linuxuser/thirdrock/finallast.txt f
check_line_count 6 ~/thirdrock/finallast.txt 8
tail -5 ~/thirdrock/finallast.txt | tee -a $outfile
blank_line
check_existence 6 /home/linuxuser/thirdrock/final.txt f
check_line_count 6 ~/thirdrock/final.txt 36
tail -5 ~/thirdrock/final.txt | tee -a $outfile
blank_line

echo -e "Question 7 - tar and cron" | tee -a $outfile

check_existence 7 ~/thirdrock.tar.gz f
file ~/thirdrock.tar.gz 2>/dev/null | tee -a $outfile
tar -tzf ~/thirdrock.tar.gz 2> /dev/null | tail -5 | tee -a $outfile
blank_line
echo -e "Crontab"
crontab -l | tail -3 | tee -a $outfile
blank_line
echo -e "Question 8 - Installing Software" | tee -a $outfile
package_check 8 calcurse
blank_line
dpkg --list calcurse | tee -a $outfile
blank_line
package_check 8 iftop
blank_line

# Submit the work
mail_out Third-Rock-Review
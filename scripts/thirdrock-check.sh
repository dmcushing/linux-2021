#!/bin/bash
# FINAL Script to Gather Student Work
source /scripts/functions.sh

clear
is_super_user
student_info Third-Rock-Assignment

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
DIRECTORY=("/usr/local/thirdrock" "/usr/local/thirdrock/house" "/usr/local/thirdrock/university" "/usr/local/thirdrock/biggianthead" "/usr/local/thirdrock/roof")

for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 2 $DIRECTORY d
done
FILE=("/usr/local/thirdrock/biggianthead/StonePhillips" )
for FILE in ${FILE[*]}
do
	check_existence 2 $FILE f
done
blank_line
echo -e "Question 3 - Filesystems"| tee -a $outfile
blank_line
check_existence 3 /dev/sdb1 b
check_part 3 is_mounted /dev/sdb1
check_part 3 mount_point /usr/local/thirdrock/university /dev/sdb1
check_part 3 fs_type /dev/sdb1 ext4
check_part 3 in_fstab /dev/sdb1
blank_line
check_existence 3 /dev/sdb2 b
check_part 3 is_mounted /dev/sdb2
check_part 3 mount_point /usr/local/thirdrock/house /dev/sdb2
check_part 3 fs_type /dev/sdb2 ext3
check_part 3 in_fstab /dev/sdb2
blank_line
check_existence 3 /dev/practice/lv_practice b
check_part 3 is_mounted /dev/mapper/practice-lv_practice
check_part 3 mount_point /usr/local/thirdrock/roof /dev/mapper/practice-lv_practice
check_part 3 fs_type /dev/mapper/practice-lv_practice ext4
check_part 3 in_fstab /dev/practice/lv_practice
blank_line
echo -e "Question 4 - Permissions and Ownership"| tee -a $outfile
check_owner 4 /usr/local/thirdrock dick
check_group 4 /usr/local/thirdrock aliens
check_permissions 4 /usr/local/thirdrock drwxrwxrwx
check_owner 4 /usr/local/thirdrock/biggianthead dick
check_group 4 /usr/local/thirdrock/biggianthead aliens
check_permissions 4 /usr/local/thirdrock/biggianthead drwxrwx---
check_owner 4 /usr/local/thirdrock/university dick
check_group 4 /usr/local/thirdrock/university university
check_permissions 4 /usr/local/thirdrock/university drwxrwx---
check_owner 4 /usr/local/thirdrock/house mamie
check_permissions 4 /usr/local/thirdrock/house drwxrwxrwx
check_owner 4 /usr/local/thirdrock/biggianthead/StonePhillips harry
check_group 4 /usr/local/thirdrock/biggianthead/StonePhillips aliens
check_permissions 4 /usr/local/thirdrock/biggianthead/StonePhillips -rw-r-----
blank_line

echo -e "Question 5 - Find" | tee -a $outfile

check_existence 5 /usr/local/thirdrock/words f
blank_line

echo -e "Question 6 - Grep" | tee -a $outfile

check_existence 6 /usr/local/thirdrock/grep1.txt f
tail -4 /usr/local/thirdrock/grep1.txt | tee -a $outfile
blank_line

echo -e "Question 7 - tar and cron" | tee -a $outfile

check_existence 7 /root/thirdrock.tar.gz f

crontab -l | tail -3 | tee -a $outfile
blank_line
echo -e "Question 8 - Installing Software" | tee -a $outfile
package_check 8 iftop
blank_line

# Submit the work
mail_out Third-Rock-Practice


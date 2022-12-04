#!/bin/bash
# FINAL Script to Gather Student Work
source /scripts/functions.sh

clear
is_super_user
student_info Star-Trek-Review

echo -e "Question 1 - Users and Groups" | tee -a $outfile
entity_exists 1 bridge group
entity_exists 1 command group
entity_exists 1 engine group
entity_exists 1 helm group
entity_exists 1 medical group
blank_line
entity_exists 1 kirk passwd
user_param 1 comment kirk "William Shatner"
user_param 1 user_in_group kirk command
user_param 1 user_in_group kirk bridge
check_existence 1 /home/kirk d
blank_line
entity_exists 1 spock passwd
user_param 1 comment spock "Leonard Nimoy"
user_param 1 user_in_group spock command
user_param 1 user_in_group spock bridge
user_param 1 account_expiry spock 2015-02-27
check_existence 1 /home/spock d
blank_line
entity_exists 1 mccoy passwd
user_param 1 comment mccoy "DeForest Kelley"
user_param 1 user_in_group mccoy command
user_param 1 user_in_group mccoy medical
user_param 1 account_expiry mccoy 1999-06-11
check_existence 1 /home/mccoy d
blank_line
entity_exists 1 uhura passwd
user_param 1 comment uhura "Nichelle Nichols"
user_param 1 user_in_group uhura bridge
user_param 1 account_expiry uhura 2022-07-30
check_existence 1 /home/uhura d
blank_line
entity_exists 1 scotty passwd
user_param 1 comment scotty "James Doohan"
user_param 1 user_in_group scotty engine
user_param 1 account_expiry scotty 2005-07-20
check_existence 1 /home/scotty d
blank_line
entity_exists 1 sulu passwd
user_param 1 comment sulu "George Takei"
user_param 1 user_in_group sulu bridge
user_param 1 user_in_group sulu helm
check_existence 1 /home/sulu d
blank_line
entity_exists 1 chekov passwd
user_param 1 comment chekov "Walter Koenig"
user_param 1 user_in_group chekov bridge
user_param 1 user_in_group chekov helm
check_existence 1 /home/chekov d
blank_line
entity_exists 1 chapel passwd
user_param 1 comment chapel "Majel Barrett"
user_param 1 user_in_group chapel medical
check_existence 1 /home/chapel d
blank_line

echo -e "Question 2 - Create Directory Structure" | tee -a $outfile
blank_line
DIRECTORY=("/home/linuxuser/startrek" "/home/linuxuser/startrek/bridge" "/home/linuxuser/startrek/planet" "/home/linuxuser/startrek/sickbay" "/home/linuxuser/startrek/transporter" "/media/sdb" "/media/sdc" "/media/trek1" "/media/trek2")

for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 2 $DIRECTORY d
done
FILE=("/home/linuxuser/startrek/planet/redshirt" )
for FILE in ${FILE[*]}
do
	check_existence 2 $FILE f
done
blank_line
echo -e "Question 3 - Filesystems"| tee -a $outfile
blank_line
check_existence 3 /dev/sdb1 b
check_part 3 is_mounted /dev/sdb1
check_part 3 mount_point /media/sdb /dev/sdb1
check_part 3 fs_type /dev/sdb1 ext2
blank_line
check_existence 3 /dev/sdc1 b
check_part 3 is_mounted /dev/sdc1
check_part 3 mount_point /media/sdc /dev/sdc1
check_part 3 fs_type /dev/sdc1 ext3
mount | grep 'sdc1' | tee -a $outfile
blank_line
check_existence 3 /dev/vg_trek1/lv_trek1 b
check_part 3 is_mounted /dev/mapper/vg_trek1-lv_trek1
check_part 3 mount_point /media/trek1 /dev/mapper/vg_trek1-lv_trek1
check_part 3 fs_type /dev/mapper/vg_trek1-lv_trek1 ext4
blank_line
check_existence 3 /dev/vg_trek2/lv_trek2 b
check_part 3 is_mounted /dev/mapper/vg_trek2-lv_trek2
check_part 3 mount_point /media/trek2 /dev/mapper/vg_trek2-lv_trek2
check_part 3 fs_type /dev/mapper/vg_trek2-lv_trek2 ext4
blank_line
lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/sdb1 /dev/sdc1 /dev/vg_trek1/lv_trek1 /dev/vg_trek2/lv_trek2 | tee -a $outfile
blank_line

echo -e "Question 4 - Permissions and Ownership"| tee -a $outfile
check_owner 4 ~/startrek linuxuser
check_group 4 ~/startrek bridge
check_permissions 4 ~/startrek drwxrwxr-x
check_owner 4 ~/startrek/bridge kirk
check_group 4 ~/startrek/bridge bridge
check_permissions 4 ~/startrek/bridge drwxrwxr-x
check_owner 4 ~/startrek/transporter scotty
check_group 4 ~/startrek/transporter engine
check_permissions 4 ~/startrek/transporter drwxrwxr-x
check_owner 4 ~/startrek/sickbay mccoy
check_group 4 ~/startrek/sickbay medical
check_permissions 4 ~/startrek/sickbay drwxrwxrwx
check_owner 4 ~/startrek/planet/redshirt spock
check_group 4 ~/startrek/planet/redshirt medical
check_permissions 4 ~/startrek/planet/redshirt -rw-r-----
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
check_line_count 6 ~/thirdrock/finallast.txt 63
tail -5 ~/thirdrock/finallast.txt | tee -a $outfile
blank_line
check_existence 6 /home/linuxuser/thirdrock/final.txt f
check_line_count 6 ~/thirdrock/final.txt 9
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
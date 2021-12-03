#!/bin/bash
# Final Exam

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Final Exam

# Question 1

entity_exists 1 bridge group
entity_exists 1 command group
entity_exists 1 engineering group
entity_exists 1 sickbay group
blank_line
entity_exists 1 kirk passwd
user_param 1 comment kirk "William Shatner"
user_param 1 user_in_group kirk bridge
user_param 1 user_in_group kirk command
blank_line
entity_exists 1 spock passwd
user_param 1 comment spock "Leonard Nimoy"
user_param 1 user_in_group spock bridge
user_param 1 user_in_group spock command
blank_line
entity_exists 1 mccoy passwd
user_param 1 comment mccoy "DeForest Kelley"
user_param 1 user_in_group mccoy sickbay
user_param 1 account_expiry mccoy 2063-06-01
blank_line
entity_exists 1 uhura passwd
user_param 1 comment uhura "Nichelle Nichols"
user_param 1 user_in_group uhura bridge
user_param 1 account_expiry uhura 2063-06-01
blank_line
entity_exists 1 scotty passwd
user_param 1 comment scotty "James Doohan"
user_param 1 user_in_group scotty engineering
user_param 1 account_expiry scotty 2063-06-01
blank_line

check_existence 2 ~/StarTrek d
check_existence 2 ~/StarTrek/Bridge d
check_existence 2 ~/StarTrek/Engineering d
check_existence 2 ~/StarTrek/Engineering/WarpCore d
check_existence 2 ~/StarTrek/SickBay d
check_existence 2 ~/StarTrek/SickBay/Quarantine d
check_existence 2 /media/StarTrek-sdb1
check_existence 2 /media/StarTrek-sdb2
check_existence 2 /media/StarTrek-lv_StarTrek
check_existence 2 ~/StarTrek/Engineering/Phaser f
check_existence 2 ~/StarTrek/SickBay/Tricorder f
blank_line

check_existence 3 /dev/sdb1 b
check_part 3 is_mounted /dev/sdb1
check_part 3 mount_point /media/StarTrek-sdb1 /dev/sdb1
check_part 3 fs_type /dev/sdb1 ext3
blank_line

check_existence 3 /dev/sdb2 b
check_part 3 is_mounted /dev/sdb2
check_part 3 mount_point /media/StarTrek-sdb2 /dev/sdb2
check_part 3 fs_type /dev/sdb2 ext4
mount | grep 'sdb2' | tee -a $outfile
blank_line

check_existence 3 /dev/vg_StarTrek/lv_StarTrek b
check_part 3 is_mounted /dev/mapper/vg_StarTrek/lv_StarTrek
check_part 3 mount_mount /media/StarTrek-lv_StarTrek
check_part 3 fs_type /dev/mapper/vg_StarTrek/lv_StarTrek ext3
blank_line

lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/sdb1 /dev/sdb2 /dev/vg_StarTrek/lv_StarTrek | tee -a $outfile
blank_line

check_owner 5 ~/StarTrek linuxuser
check_group 5 ~/StarTrek linuxuser
check_permissions 5 ~/StarTrek drwxrwxrwx
check_owner 5 ~/StarTrek/Bridge kirk
check_group 5 ~/StarTrek/Bridge command
check_permissions 5 ~/StarTrek/Bridge drwxrwx---
check_owner 5 ~/StarTrek/SickBay mccoy
check_group 5 ~/StarTrek/SickBay sickbay
check_permissions 5 ~/StarTrek/SickBay drwxrwxr-x
check_owner 5 ~/StarTrek/Engineering scotty
check_group 5 ~/StarTrek/Engineering engineering
check_permissions 5 ~/StarTrek/Engineering dr-xr-x---
check_owner 5 ~/StarTrek/Engineering/Phaser scotty
check_group 5 ~/StarTrek/Engineering/Phaser command
check_permissions 5 ~/StarTrek/Engineering/Phaser -r--r-----
blank_line

echo -e "Find Command Files:" | tee -a $outfile
ls -l ~/StarTrek/warp* | tee -a $outfile
blank_line
echo -e "Find Command contents of ~/StarTrek/STart.txt" | tee -a $outfile
check_existence 6 ~/StarTrek/STart.txt f
check_line_count 6 ~/StarTrek/STart.txt 3
tail -5 ~/StarTrek/STart.txt | tee -a $outfile
blank_line

echo -e "Grep:" | tee -a $outfile
check_existence 7 ~/StarTrek/startrek.txt f
check_line_count 7 ~/StarTrek/startrek.txt 51
tail -5 ~/StarTrek/startrek.txt | tee -a $outfile
blank_line

check_existence 8 ~/StarTrek.tar.gz f
file ~/StarTrek.tar.gz 2>/dev/null | tee -a $outfile
tar -tzvf ~/StarTrek.tar.gz 2> /dev/null | tail -5 | tee -a $outfile
blank_line

echo -e "cron jobs:" | tee -a $outfile
crontab -l | tail -5 | tee -a $outfile
blank_line

package_check 10 moon-buggy
dpkg --list moon-buggy | tee -a $outfile
blank_line
package_check 10 nmap
blank_line
mail_out_test 02 Final Exam

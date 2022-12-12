#!/bin/bash
# Final Exam

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info_midterm Final Exam

# Question 1

entity_exists 1 enterprise group
entity_exists 1 officer group
entity_exists 1 engineering group
entity_exists 1 sickbay group
blank_line
entity_exists 1 picard passwd
user_param 1 comment picard "Patrick Stewart"
user_param 1 user_in_group picard enterprise
user_param 1 user_in_group picard officer
blank_line
entity_exists 1 riker passwd
user_param 1 comment riker "Jonathan Frakes"
user_param 1 user_in_group riker enterprise
user_param 1 user_in_group riker officer
blank_line
entity_exists 1 crusher passwd
user_param 1 comment crusher "Gates McFadden"
user_param 1 user_in_group crusher sickbay
user_param 1 account_expiry crusher 2063-06-01
blank_line
entity_exists 1 data passwd
user_param 1 comment data "Brent Spiner"
user_param 1 user_in_group data enterprise
user_param 1 account_expiry data 2063-06-01
blank_line
entity_exists 1 laforge passwd
user_param 1 comment laforge "LeVar Burton"
user_param 1 user_in_group laforge engineering
user_param 1 account_expiry laforge 2063-06-01
blank_line

check_existence 2 ~/StarTrek d
check_existence 2 ~/StarTrek/Bridge d
check_existence 2 ~/StarTrek/Engineering d
check_existence 2 ~/StarTrek/Engineering/WarpCore d
check_existence 2 ~/StarTrek/SickBay d
check_existence 2 ~/StarTrek/SickBay/Quarantine d
check_existence 2 /media/StarTrek-sdb1 d
check_existence 2 /media/StarTrek-sdc1 d
check_existence 2 /media/StarTrek-lv_StarTrek d
check_existence 2 ~/StarTrek/Engineering/Phaser f
check_existence 2 ~/StarTrek/SickBay/Tricorder f
blank_line

check_existence 3 /dev/sdb1 b
check_part 3 is_mounted /dev/sdb1
check_part 3 mount_point /media/StarTrek-sdb1 /dev/sdb1
check_part 3 fs_type /dev/sdb1 ext3
blank_line

check_existence 3 /dev/sdc1 b
check_part 3 is_mounted /dev/sdc1
check_part 3 mount_point /media/StarTrek-sdc1 /dev/sdc1
check_part 3 fs_type /dev/sdc1 ext4
mount | grep 'sdc1' | tee -a $outfile
blank_line

check_existence 3 /dev/vg_StarTrek/lv_StarTrek b
check_part 3 is_mounted /dev/mapper/vg_StarTrek-lv_StarTrek
check_part 3 mount_mount /media/StarTrek-lv_StarTrek
check_part 3 fs_type /dev/mapper/vg_StarTrek-lv_StarTrek ext3
blank_line

lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/sdb1 /dev/sdc1 /dev/vg_StarTrek/lv_StarTrek | tee -a $outfile
blank_line

check_owner 5 ~/StarTrek linuxuser
check_group 5 ~/StarTrek linuxuser
check_permissions 5 ~/StarTrek drwxrwxrwx
check_owner 5 ~/StarTrek/Bridge picard
check_group 5 ~/StarTrek/Bridge officer
check_permissions 5 ~/StarTrek/Bridge drwxrwx---
check_owner 5 ~/StarTrek/SickBay crusher
check_group 5 ~/StarTrek/SickBay sickbay
check_permissions 5 ~/StarTrek/SickBay drwxrwxr-x
check_owner 5 ~/StarTrek/Engineering laforge
check_group 5 ~/StarTrek/Engineering engineering
check_permissions 5 ~/StarTrek/Engineering dr-xr-x---
check_owner 5 ~/StarTrek/Engineering/Phaser laforge
check_group 5 ~/StarTrek/Engineering/Phaser officer
check_permissions 5 ~/StarTrek/Engineering/Phaser -r--r-----
blank_line

echo -e "Find Command Files:" | tee -a $outfile
ls -l ~/StarTrek/warp* | tee -a $outfile
blank_line
echo -e "Find Command contents of ~/StarTrek/STart.txt" | tee -a $outfile
check_existence 6 ~/StarTrek/STart.txt f
check_line_count 6 ~/StarTrek/STart.txt 2
tail -5 ~/StarTrek/STart.txt | tee -a $outfile
blank_line

echo -e "Grep:" | tee -a $outfile
check_existence 7 ~/StarTrek/startrek.txt f
check_line_count 7 ~/StarTrek/startrek.txt 317
tail -5 ~/StarTrek/startrek.txt | tee -a $outfile
blank_line

check_existence 8 ~/StarTrek.tar.gz f
file ~/StarTrek.tar.gz 2>/dev/null | tee -a $outfile
tar -tzf ~/StarTrek.tar.gz 2> /dev/null | tail -5 | tee -a $outfile
blank_line

echo -e "cron jobs:" | tee -a $outfile
crontab -l | tail -5 | tee -a $outfile
blank_line

package_check 10 test02
blank_line
package_check 10 nmap
blank_line
mail_out_test 02 Final Exam

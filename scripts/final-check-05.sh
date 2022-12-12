#!/bin/bash
# Final Exam

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info_midterm Final Exam

# Question 1

entity_exists 1 delorean group
entity_exists 1 past group
entity_exists 1 present group
entity_exists 1 parent group
entity_exists 1 dance group
blank_line
entity_exists 1 marty passwd
user_param 1 comment marty "Michael J Fox"
user_param 1 user_in_group marty delorean
user_param 1 user_in_group marty present
user_param 1 user_in_group marty dance
blank_line
entity_exists 1 doc passwd
user_param 1 comment doc "Christopher Lloyd"
user_param 1 user_in_group doc delorean
user_param 1 user_in_group doc present
blank_line
entity_exists 1 biff passwd
user_param 1 comment biff "Tom Wilson"
user_param 1 user_in_group biff past
user_param 1 user_in_group biff dance
user_param 1 account_expiry biff 2015-10-21
blank_line
entity_exists 1 lorraine passwd
user_param 1 comment lorraine "Lea Thompson"
user_param 1 user_in_group lorraine past
user_param 1 user_in_group lorraine present
user_param 1 user_in_group lorraine parent
user_param 1 user_in_group lorraine dance
user_param 1 account_expiry lorraine 2015-10-21
blank_line
entity_exists 1 strickland passwd
user_param 1 comment strickland "James Tolkan"
user_param 1 user_in_group strickland past
user_param 1 account_expiry strickland 2015-10-21
blank_line

check_existence 2 ~/BTTF d
check_existence 2 ~/BTTF/1985 d
check_existence 2 ~/BTTF/1955 d
check_existence 2 ~/BTTF/1955/Dance d
check_existence 2 ~/BTTF/Delorean d
check_existence 2 ~/BTTF/Delorean/Console d
check_existence 2 /media/sdh d
check_existence 2 /media/sdi d
check_existence 2 /media/lvm d
blank_line

check_existence 2 ~/BTTF/1955/Dance/Guitar f
check_existence 2 ~/BTTF/Delorean/Console/FluxCapacitor f
blank_line

check_existence 3 /dev/sdh1 b
check_part 3 is_mounted /dev/sdh1
check_part 3 mount_point /media/sdh /dev/sdh1
check_part 3 fs_type /dev/sdh1 vfat
blank_line

check_existence 3 /dev/sdi1 b
check_part 3 is_mounted /dev/sdi1
check_part 3 mount_point /media/sdi /dev/sdi1
check_part 3 fs_type /dev/sdi1 ext4
mount | grep 'sdi1' | tee -a $outfile
blank_line

check_existence 3 /dev/vg_1955/lv_1955 b
check_part 3 is_mounted /dev/mapper/vg_1955-lv_1955
check_part 3 mount_mount /media/lvm
check_part 3 fs_type /dev/mapper/vg_1955-lv_1955 ext3
blank_line

lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/sdh1 /dev/sdi1 /dev/vg_1955/lv_1955 | tee -a $outfile
blank_line

check_owner 5 ~/BTTF linuxuser
check_group 5 ~/BTTF linuxuser
check_permissions 5 ~/BTTF drwxrwxrwx
check_owner 5 ~/BTTF/1955 lorraine
check_group 5 ~/BTTF/1955 past
check_permissions 5 ~/BTTF/1955 drwxrwx---
check_owner 5 ~/BTTF/1985 doc
check_group 5 ~/BTTF/1985 present
check_permissions 5 ~/BTTF/1985 drwxrwxr-x
check_owner 5 ~/BTTF/1955/Dance lorraine
check_group 5 ~/BTTF/1955/Dance past
check_permissions 5 ~/BTTF/1955/Dance dr-xr-x---
check_owner 5 ~/BTTF/1955/Dance/Guitar marty
check_group 5 ~/BTTF/1955/Dance/Guitar past
check_permissions 5 ~/BTTF/1955/Dance/Guitar -r--r-----
blank_line

echo -e "Find Command Files:" | tee -a $outfile
ls -l ~/BTTF/back* | tee -a $outfile
blank_line
echo -e "Find Command contents of ~/StarWars/SAtlr.txt" | tee -a $outfile
check_existence 6 ~/BTTF/MDaol.txt f
check_line_count 6 ~/BTTF/MDaol.txt 6
tail -5 ~/BTTF/MDaol.txt | tee -a $outfile
blank_line

echo -e "Grep:" | tee -a $outfile
check_existence 7 ~/BTTF/docmarty.txt f
check_line_count 7 ~/BTTF/docmarty.txt 62
tail -5 ~/BTTF/docmarty.txt | tee -a $outfile
blank_line

check_existence 8 ~/bttf.tar.gz f
file ~/bttf.tar.gz 2>/dev/null | tee -a $outfile
tar -tzf ~/bttf.tar.gz 2> /dev/null | tail -5 | tee -a $outfile
blank_line

echo -e "cron jobs:" | tee -a $outfile
crontab -l | tail -5 |  tee -a $outfile
blank_line

package_check 10 test01
blank_line
package_check 10 nmap
blank_line
mail_out_test 05 Final Exam

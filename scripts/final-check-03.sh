#!/bin/bash
# Final Exam

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info_midterm Final Exam

# Question 1

entity_exists 1 matrix group
entity_exists 1 redpill group
entity_exists 1 group ship
entity_exists 1 group construct
blank_line
entity_exists 1 neo passwd
user_param 1 comment neo "Keanu Reeves"
user_param 1 user_in_group neo matrix
user_param 1 user_in_group neo redpill
user_param 1 user_in_group neo ship
blank_line
entity_exists 1 morpheus passwd
user_param 1 comment morpheus "Laurence Fishburne"
user_param 1 user_in_group morpheus matrix
user_param 1 user_in_group morpheus redpill
user_param 1 user_in_group morpheus ship
blank_line
entity_exists 1 trinity passwd
user_param 1 comment penny "Carrie-Ann Moss"
user_param 1 user_in_group trinity ship
user_param 1 user_in_group trinity matrix
user_param 1 account_expiry penny 2125-01-01
blank_line
entity_exists 1 smith passwd
user_param 1 comment penny "Hugo Weaving"
user_param 1 user_in_group smith construct
user_param 1 account_expiry smith 2125-01-01
blank_line
entity_exists 1 oracle passwd
user_param 1 comment penny "Gloria Foster"
user_param 1 user_in_group smith construct
user_param 1 account_expiry smith 2125-01-01
blank_line

check_existence 2 ~/Matrix d
check_existence 2 ~/Matrix/Ship d
check_existence 2 ~/Matrix/Ship/Chair d
check_existence 2 ~/Matrix/Whiterabbit d
check_existence 2 ~/Matrix/Agents d
check_existence 2 ~/Matrix/Agents/Rooftop d
check_existence 2 /media/Matrix-sdb1 d
check_existence 2 /media/Matrix-sdb2 d
check_existence 2 /media/Matrix-lv_matrix d
blank_line

check_existence 2 ~/Matrix/Whiterabbit/tattoo f
check_existence 2 ~/Matrix/Agents/bulletdodge f
blank_line

check_existence 3 /dev/sdb1 b
check_part 3 is_mounted /dev/sdb1
check_part 3 mount_point /media/Matrix-sdb1 /dev/sdb1
check_part 3 fs_type /dev/sdb1 ext3
blank_line

check_existence 3 /dev/sdb2 b
check_part 3 is_mounted /dev/sdb2
check_part 3 mount_point /media/Matrix-sdb2 /dev/sdb2
check_part 3 fs_type /dev/sdb2 ext4
blank_line

check_existence 3 /dev/vg_matrix/lv_matrix b
check_part 3 is_mounted /dev/mapper/vg_matrix-lv_matrix
check_part 3 mount_mount /media/Matrix-lv_matrix
check_part 3 fs_type /dev/mapper/vg_matrix-lv_matrix ext4
blank_line

lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/sdb1 /dev/sdb2 /dev/vg_matrix/lv_matrix | tee -a $outfile
blank_line

check_owner 5 ~/Matrix linuxuser
check_group 5 ~/Matrix linuxuser
check_permissions 5 ~/Matrix drwxrwxrwx
check_owner 5 ~/Matrix/Ship morpheus
check_group 5 ~/Matrix/Ship ship
check_permissions 5 ~/Matrix/Ship drwxrwx---
check_owner 5 ~/Matrix/Whiterabbit linuxuser
check_group 5 ~/Matrix/Whiterabbit construct
check_permissions 5 ~/Matrix/Whiterabbit drwxrwxr-x
check_owner 5 ~/Matrix/Agents linuxuser
check_group 5 ~/Matrix/Agents construct
check_permissions 5 ~/Matrix/Agents dr-xr-x---
check_owner 5 ~/Matrix/Agents/bulletdodge neo
check_group 5 ~/Matrix/Agents/bulletdodge construct
check_permissions 5 ~/Matrix/Agents/bulletdodge -r--r-----
blank_line

echo -e "Find Command Files:" | tee -a $outfile
ls -l ~/Matrix/pill* | tee -a $outfile
blank_line
echo -e "Find Command contents of ~/Matrix/MLaory.txt" | tee -a $outfile
check_existence 6 ~/Matrix/MLaory.txt f
check_line_count 6 ~/Matrix/MLaory.txt 2
tail -5 ~/Matrix/MLaory.txt | tee -a $outfile
blank_line

echo -e "Grep:" | tee -a $outfile
check_existence 7 ~/Matrix/redblue.txt f
check_line_count 7 ~/Matrix/redblue.txt 182
tail -5 ~/Matrix/redblue.txt | tee -a $outfile
blank_line

check_existence 8 ~/Matrix.tar.gz f
file ~/Matrix.tar.gz 2>/dev/null | tee -a $outfile
tar -tzvf ~/Matrix.tar.gz 2> /dev/null | tail -5 | tee -a $outfile
blank_line

echo -e "cron jobs:" | tee -a $outfile
crontab -l | tail -5 |  tee -a $outfile
blank_line

package_check 10 moon-buggy
dpkg --list moon-buggy | tee -a $outfile
blank_line
package_check 10 nmap
blank_line
mail_out_test 03 Final Exam

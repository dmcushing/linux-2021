#!/bin/bash
# Software Packages

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info File System Quiz

tree ~/Quiz07
blank_line

lsblk -l -o NAME,SIZE,RO,FSTYPE,MOUNTPOINT /dev/sdb1
blank_line

entity_exists 4 quiz7 passwd
user_param 4 account_expiry quiz7 2021-11-18
user_param 4 user_in_group quiz7 linuxuser
check_existence 4 "/home/quiz7" d
blank_line

package_check 5 fortune
blank_line

check_existence 6 ~/quiz7.tar.gz f
tar tzvf ~/Quiz07/YaBa.tar.gz | nl 2</dev/null | tee -a $outfile
blank_line

mail_out File System Quiz

#!/bin/bash
# Software Packages

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info File System Quiz

tree ~/Quiz07 | tee -a $outfile
blank_line

lsblk -l -o NAME,SIZE,RO,FSTYPE,MOUNTPOINT /dev/sde | tee -a $outfile
blank_line

entity_exists 4 quiz7 passwd
user_param 4 account_expiry quiz7 2023-11-18
user_param 4 user_in_group quiz7 linuxuser
check_existence 4 "/home/quiz7" d
blank_line

package_check 5 xinetd
check_existence 5 ~/Quiz07/xinetd-status.txt f
head -5 ~/Quiz07/xinetd-status.txt | tee -a $outfile
blank_line

check_existence 6 ~/Quiz07/YaTa.tar.gz f
tar tzvf ~/Quiz07/YaTa.tar.gz | tail -5 | tee -a $outfile
blank_line

mail_out File System Quiz

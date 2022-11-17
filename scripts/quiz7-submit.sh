#!/bin/bash
# Software Packages

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info File System Quiz

tree ~/Quiz7 | tee -a $outfile
blank_line

lsblk -l -o NAME,SIZE,RO,FSTYPE,MOUNTPOINT /dev/sde /dev/sdf | tee -a $outfile
blank_line
mount | grep "sde\|sdf" | tee -a $outfile
blank_line

entity_exists 4 quiz7 passwd
user_param 4 account_expiry quiz7 2037-11-08
user_param 4 user_in_group quiz7 linuxuser
check_existence 4 "/home/quiz7" d
blank_line

package_check 5 xinetd
check_existence 5 ~/Quiz7/xinetd-status.txt f
head -5 ~/Quiz7/xinetd-status.txt | tee -a $outfile
blank_line

check_existence 6 ~/Quiz7/YaTa.tar.gz f
tar tzvf ~/Quiz7/YaTa.tar.gz | tail -5 | tee -a $outfile
blank_line

mail_out Filesystem Quiz7

#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info LVM Assignment
echo -e "Is the LVM created and mounted?" | tee -a $outfile
blank_line
lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/volgroupassign/lv_assignment | tee -a $outfile
blank_line

mail_out LVM Assignment

#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info LVM Quiz
echo -e "Is the LVM created and mounted?" | tee -a $outfile
blank_line
lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/vg_quiz/lv_quiz | tee -a $outfile
blank_line
mount | grep 'quiz' | tee -a $outfile
blank_line
vgdisplay vg_quiz | tee -a $outfile
blank_line

mail_out LVM Quiz
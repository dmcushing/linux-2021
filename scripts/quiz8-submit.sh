#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info Quiz 8
lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT,RO /dev/vg_quiz8/lv_quiz8 | tee -a $outfile
blank_line
mount | grep 'media' | tee -a $outfile
blank_line
pvdisplay --short
blank_line
vgdisplay vg_quiz8 | tee -a $outfile
blank_line

mail_out Quiz 8
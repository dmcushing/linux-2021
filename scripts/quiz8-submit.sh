#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info Quiz 8
lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT,PARTTYPENAME /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1 /dev/vg_quiz8/lv_quiz8 | tee -a $outfile
blank_line
mount | grep "media" | tee -a $outfile
blank_line
pvdisplay -C | tee -a $outfile
blank_line
vgdisplay --short vg_quiz8 | tee -a $outfile
blank_line
lvdisplay | tee -a $outfile
mail_out Quiz 8
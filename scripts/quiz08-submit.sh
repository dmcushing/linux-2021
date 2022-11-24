#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info Quiz 08
lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT,PARTTYPENAME /dev/sde1 /dev/sdf1 /dev/sdg1 /dev/sdh1 /dev/sdi1 /dev/grp_quiz08/vol_quiz08 | tee -a $outfile
blank_line
mount | grep "media" | tee -a $outfile
blank_line
pvdisplay -C | tee -a $outfile
blank_line
vgdisplay --short vol_quiz08 | tee -a $outfile
blank_line
lvdisplay | tee -a $outfile
mail_out Quiz 08
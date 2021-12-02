#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info LVM-Core Quiz
echo -e "Is the LVM created and mounted?" | tee -a $outfile
blank_line
lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/vg_quiz8/lv_quiz8 | tee -a $outfile
blank_line
mount | grep 'quiz8' | tee -a $outfile
blank_line
vgdisplay vg_quiz8 | tee -a $outfile
blank_line

echo -e "The xinetd service is `systemctl is-enabled xinetd.service 2</dev/null`" | tee -a $outfile
blank_line
nc -z -vv localhost 1313
nc -z -vv localhost 1313 >> $outfile 2>&1
blank_line
echo -e "Configuration File" | tee -a $outfile
cat /etc/xinetd.d/fortune | tee -a $outfile
blank_line

mail_out LVM-Core Quiz
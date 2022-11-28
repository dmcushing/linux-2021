#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info cron Lab
tree -s ~/cronlab
echo -e "crontab entries:" | tee -a $outfile
blank_line
grep "^[^#;]" /var/spool/cron/crontabs/root &> /dev/null | tee -a $outfile
blank_line
grep "^[^#;]" /var/spool/cron/crontabs/linuxuser &> /dev/null | tee -a $outfile
blank_line
check_existence - ~/cronlab/cronlab.tar.gz f
file ~/cronlab/cronlab.tar.gz &> /dev/null | tee -a $outfile
tar tzf ~/cronlab/cronlab.tar.gz &> /dev/null | tee -a $outfile
blank_line
mail_out cron Lab

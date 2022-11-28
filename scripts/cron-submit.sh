#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info cron Lab
tree -s ~/cronlab
echo -e "crontab entries:" | tee -a $outfile
blank_line
grep "^[^#;]" /var/spool/cron/crontabs/root | tee -a $outfile
blank_line
grep "^[^#;]" /var/spool/cron/crontabs/linuxuser | tee -a $outfile
blank_line
check_existence - ~/cronlab/cronlab.tar.gz
file ~/cronlab/cronlab.tar.gz | tee -a $outfile
tar tzvf ~/cronlab/cronlab.tar.gz | tee -a $outfile
mail_out cron Lab

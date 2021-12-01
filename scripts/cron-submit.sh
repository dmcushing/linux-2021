#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info cron Quiz
echo -e "crontab entries:" | tee -a $outfile
blank_line
grep "^[^#;]" /var/spool/cron/crontabs/root | tee -a $outfile
blank_line
grep "^[^#;]" /var/spool/cron/crontabs/linuxuser | tee -a $outfile

mail_out cron Quiz

#!/bin/bash
source /scripts/functions.sh

clear
is_super_user
student_info Lab 05

echo -e "rsyslog listening on 514 UDP and TCP" | tee -a $outfile
netstat -natu | grep ":514 " | tee -a $outfile
blank_line
echo -e "/etc/rsyslog.d/00-byhost.conf" | tee -a $outfile
cat /etc/rsyslog.d/00-byhost.conf | tee -a $outfile
blank_line
echo -e "crontab" | tee -a $outfile
crontab -l | tail -5 | tee -a $outfile 
# Submit the work
mail_out Lab 05

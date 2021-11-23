#!/bin/bash
source /scripts/functions.sh

clear
is_super_user
student_info Lab 04

#
# Do the services exist?
#
   echo -e "Services enabled" | tee -a $outfile
   blank_line
   sudo systemctl is-enabled xinetd | tee -a $outfile
   netstat -natu | grep ":5900\|:2323\|:23 " | tee -a $outfile
   blank_line
   echo -e "Configuration Files" | tee -a $outfile
   cat /etc/xinetd.d/testservice | tee -a $outfile
   blank_line
   cat /usr/bin/testservice.sh | tee -a $outfile
   blank_line
   cat /etc/xinetd.d/telnet | tee -a $outfile
   blank_line
   grep -w "telnet" /etc/services | tee -a $outfile

# Submit the work
mail_out Lab 04

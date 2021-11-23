#!/bin/bash
source /scripts/functions.sh

clear
is_super_user
student_info Core Services Lab

#
# Do the services exist?
#
   echo -e "The xinetd services is `systemctl is-enabled xinetd.service 2</dev/null`" | tee -a $outfile
   blank_line
   nc -zv localhost 2323 | tee -a $outfile
   nc -zv localhost 5900 | tee -a $outfile
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
mail_out Core Services Lab
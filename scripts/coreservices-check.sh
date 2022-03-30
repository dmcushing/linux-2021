#!/bin/bash
source /scripts/functions.sh

clear
is_super_user
student_info Core Services Lab

echo -e "1. Does mailperson exist?" | tee -a $outfile
blank_line
echo -e "2. Mail to mailperson in /var/mail/mailperson:" | tee -a $outfile
check_existence 2 /var/mail/mailperson f
tail -5 /var/mail/mailperson 2>/dev/null | tee -a $outfile
echo -e "3. /var/www/html/index2.html created" | tee -a $outfile
check_existence 3 /var/www/html/index2.html f
tail -5 /var/www/html/index2.html 2>/dev/null | tee -a $outfile
echo -e "4. grep /var/log/syslog for mailperson" | tee -a $outfile
check_existence 4 ~/mailperson.log f
tail -5 ~/mailperson.log 2>/dev/null | tee -a $outfile
echo -e "5. grep /var/log/apache2/access.log for index2.html" | tee -a $outfile
check_existence 4 ~/apache.log f
tail -5 ~/apache.log 2>/dev/null | tee -a $outfile

# Submit the work
mail_out Core Services Lab
#!/bin/bash
source /scripts/functions.sh

clear
is_super_user
student_info Core Services

entity_exists 1 mailpeople group
blank_line
entity_exists 2 mailperson1 passwd
check_existence 2 /home/mailperson1 d
user_param 2 account_expiry mailperson1 2030-06-30
user_param 2 user_in_group mailperson1 mailpeople
blank_line

check_existence 3 ~/corelab d
check_permissions 3 ~/corelab drwxrwx---
check_owner 3 ~/corelab linuxuser
check_group 3 ~/corelab mailpeople
blank_line

echo -e "Was mail sent to mailperson1?" | tee -a $outfile
check_existence 4 /var/mail/mailperson1 f
tail -7 /var/mail/mailperson1 2>/dev/null | tee -a $outfile
blank_line
echo -e "grep /var/log/syslog for mailperson1" | tee -a $outfile
check_existence 5 ~/corelab/mailperson.log f
tail -5 ~/corelab/mailperson.log 2>/dev/null | tee -a $outfile
blank_line

echo -e "Is /var/www/html/index2.html created?" | tee -a $outfile
check_existence 6 /var/www/html/index2.html f
tail -5 /var/www/html/index2.html 2>/dev/null | tee -a $outfile
blank_line
echo -e "grep /var/log/apache2/access.log for index2.html" | tee -a $outfile
check_existence 7 ~/corelab/index2.log f
tail -5 ~/corelab/index2.log 2>/dev/null | tee -a $outfile
blank_line

echo -e "Partitions and Mount Points" | tee -a $outfile
lsblk /dev/sdb /dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg | tee -a $outfile
mount | grep "core" | tee -a $outfile

# Submit the work
mail_out Core Services
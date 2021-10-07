#!/bin/bash
# Quiz 02 - Tom Hanks

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Quiz 03 Postal Codes
tree /home/linuxuser/Quiz3 | tee -a $outfile

check_existence 1 /home/linuxuser/Quiz3/postalcodes.txt h
blank_line
check_existence 2 /home/linuxuser/Quiz3/dbury.txt f
tail -5 /home/linuxuser/Quiz3/dbury.txt | tee -a $outfile
blank_line
check_existence 3 /home/linuxuser/Quiz3/A0K.txt f
tail -5 /home/linuxuser/Quiz3/A0K.txt | tee -a $outfile
blank_line
check_existence 4 /home/linuxuser/Quiz3/ag.txt f
tail -5 /home/linuxuser/Quiz3/ag.txt |tee -a $outfile
blank_line
check_existence 5 /home/linuxuser/Quiz3/test.txt f
check_owner 5 /home/linuxuser/Quiz3/test.txt quiz3
check_group 5 /home/linuxuser/Quiz3/test.txt quiz3
check_permissions 5 /home/linuxuser/Quiz3/test.txt -rw-r-----
ls -l /home/linuxuser/Quiz3/test.txt | tee -a $outfile

mail_out Postal Codes Quiz3
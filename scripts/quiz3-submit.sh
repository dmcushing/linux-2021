#!/bin/bash
# Quiz 02 - Tom Hanks

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Quiz 03 Postal Codes I

echo -e "Postal Codes I: $( date +"%D %T" )" | tee -a $outfile
blank_line
 
tree ~/Quiz3 | tee -a $outfile

blank_line

check_existence 1 ~/Quiz3/CApostalcodes.txt h
blank_line

check_existence 2 ~/Quiz3/dbury.txt f
check_line_count 2 ~/Quiz3/dbury.txt 1428
tail -5 ~/Quiz3/dbury.txt | tee -a $outfile
blank_line

check_existence 3 ~/Quiz3/A0K.txt f
check_line_count 3 ~/Quiz3/A0K.txt 32
tail -5 ~/Quiz3/A0K.txt | tee -a $outfile
blank_line

check_existence 4 ~/Quiz3/ag.txt f
check_line_count 4 ~/Quiz3/ag.txt 6
tail -5 ~/Quiz3/ag.txt |tee -a $outfile
blank_line

check_existence 5 ~/Quiz3/test.txt f
blank_line

check_owner 6 ~/Quiz3/test.txt testuser
check_group 6 ~/Quiz3/test.txt testgroup
blank_line

check_permissions 7 ~/Quiz3/test.txt -rw-r-----
blank_line

check_existence 8 ~/Quiz3/head.txt f
check_line_count 8 ~/Quiz3/head.txt 5
tail -5 ~/Quiz3/head.txt | tee -a $outfile

mail_out Postal Codes I
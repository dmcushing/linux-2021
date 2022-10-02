#!/bin/bash
# Quiz 02 - Tom Hanks

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Quiz 03 Postal Codes II

export TZ=America/Toronto
echo -e "Postal Codes II: $( date +"%D %T" )" | tee -a $outfile
blank_line

tree ~/Quiz03 | tee -a $outfile
blank_line

check_existence 1 ~/Quiz03/pcode.txt h
blank_line

check_existence 2 ~/Quiz03/lmsford.txt f
check_line_count 2 ~/Quiz03/lmsford.txt 2
tail -5 ~/Quiz03/lmsford.txt | tee -a $outfile
blank_line

check_existence 3 ~/Quiz03/PEI.txt f
check_line_count 3 ~/Quiz03/PEI.txt 1012
tail -5 ~/Quiz03/PEI.txt | tee -a $outfile
blank_line

check_existence 4 ~/Quiz03/ag.txt f
check_line_count 4 ~/Quiz03/ag.txt 20
tail -5 ~/Quiz03/ag.txt |tee -a $outfile
blank_line

check_existence 5 ~/Quiz03/test.txt f
blank_line

check_owner 6 ~/Quiz03/test.txt quiz03
check_group 6 ~/Quiz03/test.txt quiz03
blank_line

check_permissions 7 ~/Quiz03/test.txt -rw-r-----
blank_line

check_existence 8 ~/Quiz03/tail.txt f
check_line_count 8 ~/Quiz03/tail.txt 15
tail -5 ~/Quiz03/tail.txt | tee -a $outfile

mail_out Postal Codes II
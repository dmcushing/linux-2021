#!/bin/bash
# Quiz 02 - Tom Hanks

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Quiz 03 Postal Codes
tree /home/linuxuser/Quiz4 | tee -a $outfile

check_existence 1 /home/linuxuser/Quiz4/polysort1.txt f
check_line_count 1 /home/linuxuser/Quiz4/polysort1.txt 20
head -5 /home/linuxuser/Quiz4/polysort1.txt 2>/dev/null | tee -a $outfile
blank_line
check_existence 2 /home/linuxuser/Quiz4/polysort2.txt f
check_line_count 2 /home/linuxuser/Quiz4/polysort1.txt 20
head -5 /home/linuxuser/Quiz4/polysort2.txt 2>/dev/null| tee -a $outfile
blank_line

mail_out Archiving and Stuff Quiz4
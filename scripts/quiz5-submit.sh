#!/bin/bash
# Quiz 02 - Tom Hanks

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Quiz 03 Postal Codes
tree /home/linuxuser/Quiz | tee -a $outfile

check_existence 1 /home/linuxuser/Quiz4/polysort1.txt f
check_line_count 1 /home/linuxuser/Quiz4/polysort1.txt 20
head -5 /home/linuxuser/Quiz4/polysort1.txt 2>/dev/null | tee -a $outfile
blank_line
check_existence 2 /home/linuxuser/Quiz4/polysort2.txt f
check_line_count 2 /home/linuxuser/Quiz4/polysort2.txt 20
head -5 /home/linuxuser/Quiz4/polysort2.txt 2>/dev/null| tee -a $outfile
blank_line
check_existence 3 /home/linuxuser/Quiz4/daemon.txt f
head -5 /home/linuxuser/Quiz4/daemon.txt 2>/dev/null| tee -a $outfile
blank_line
check_existence 4 /home/linuxuser/Quiz4/etc.txt f
head -5 /home/linuxuser/Quiz4/etc.txt 2>/dev/null| tee -a $outfile
blank_line
check_existence 5 /home/linuxuser/Quiz4/sda1.txt f
head -5 /home/linuxuser/Quiz4/sda1.txt 2>/dev/null| tee -a $outfile
blank_line
check_existence 6 /home/linuxuser/Quiz4/reawords.txt f
check_line_count 6 /home/linuxuser/Quiz4/reawords.txt 4
head -5 /home/linuxuser/Quiz4/reawords.txt 2>/dev/null | tee -a $outfile
blank_line
check_existence 7 /home/linuxuser/quiz4.tar.gz f
tar -tzvf /home/linuxuser/quiz4.tar.gz 2>/dev/null | tee -a $outfile

mail_out Archiving_and_Stuff Quiz4
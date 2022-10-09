#!/bin/bash
# Quiz 04 - Archiving


source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Quiz 04 Archiving

check_existence 1 ~/Quiz4/sorted1.txt f
check_line_count 1 ~/Quiz4/sorted1.txt 20
head -5 ~/Quiz4/sorted1.txt 2>/dev/null | tee -a $outfile
blank_line

check_existence 2 ~/Quiz4/sorted2.txt f
check_line_count 2 ~/Quiz4/sorted2.txt 20
head -5 /Quiz4/sorted2.txt 2>/dev/null| tee -a $outfile
blank_line

check_existence 3 ~/Quiz4/psaux.txt f
check_line_count 3 ~/Quiz4/psaux.txt 1
head -5 ~/Quiz4/psaux.txt 2>/dev/null| tee -a $outfile
blank_line

check_existence 4 ~/Quiz4/etc.txt f
head -5 /home/linuxuser/Quiz4/etc.txt 2>/dev/null| tee -a $outfile
blank_line

check_existence 5 ~/Quiz4/run.txt f
head -5 /home/linuxuser/Quiz4/run.txt 2>/dev/null| tee -a $outfile
blank_line

check_existence 6 /home/linuxuser/Quiz4/reawords.txt f
check_line_count 6 /home/linuxuser/Quiz4/reawords.txt 4
head -5 /home/linuxuser/Quiz4/reawords.txt 2>/dev/null | tee -a $outfile
blank_line

check_owner 7 ~/Quiz4/notsorted.TXT quiz4user
check_group 7 ~/Quiz4/notsorted.TXT quiz4group
blank_line

check_existence 8 ~/Quiz4/sortwords.txt h
blank_line

check_existence 9 ~/quiz4.tar.gz f
file ~/quiz4.tar.gz 2>/dev/null | tee -a $outfile
tar -tzf /home/linuxuser/quiz4.tar.gz 2>/dev/null | tee -a $outfile
blank_line
tree /home/linuxuser/Quiz4 | tee -a $outfile

mail_out Archiving Quiz4
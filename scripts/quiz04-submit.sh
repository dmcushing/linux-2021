#!/bin/bash
# Quiz 04 - Archiving


source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Quiz 04 Archiving

check_existence 1 ~/Quiz04/sorted1.txt f
check_line_count 1 ~/Quiz04/sorted1.txt 20
head -5 ~/Quiz04/sorted1.txt 2>/dev/null | tee -a $outfile
blank_line

check_existence 2 ~/Quiz04/sorted2.txt f
check_line_count 2 ~/Quiz04/sorted2.txt 20
head -5 ~/Quiz04/sorted2.txt 2>/dev/null| tee -a $outfile
blank_line

check_existence 3 ~/Quiz04/psaux.txt f
check_line_count 3 ~/Quiz04/psaux.txt 1
head -5 ~/Quiz04/psaux.txt 2>/dev/null| tee -a $outfile
blank_line

check_existence 4 ~/Quiz04/boot.txt f
head -5 /home/linuxuser/Quiz04/boot.txt 2>/dev/null| tee -a $outfile
blank_line

check_existence 5 ~/Quiz04/root.txt f
head -5 ~/Quiz04/root.txt 2>/dev/null| tee -a $outfile
blank_line

check_existence 6 /home/linuxuser/Quiz04/soawords.txt f
check_line_count 6 /home/linuxuser/Quiz04/soawords.txt 5
head -5 /home/linuxuser/Quiz04/soawords.txt 2>/dev/null | tee -a $outfile
blank_line

check_owner 7 ~/Quiz04/notsorted.TXT sortuser
check_group 7 ~/Quiz04/notsorted.TXT sortgroup
blank_line

check_existence 8 ~/Quiz04/tobesorted.txt h
blank_line

check_existence 9 ~/quiz04.tar.bz2 f
file ~/quiz04.tar.bz2 2>/dev/null | tee -a $outfile
tar -tzf ~/quiz04.tar.bz2 2>/dev/null | tee -a $outfile
blank_line
tree ~/Quiz04 | tee -a $outfile

mail_out Archiving Quiz04
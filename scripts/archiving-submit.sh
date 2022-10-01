#!/bin/bash
# Archiving and Other Bits2 Lab

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Archiving 02

check_existence 1 ~/archiving/hello-2.8.tar.gz f
check_existence 1 ~/archiving/words f
blank_line

check_existence 2 ~/archiving/hello-2.8 d
blank_line

check_existence 3 ~/archiving/hello-2.8.tar.bz2 f
file ~/archiving/hello-2.8.tar.bz2 | tee -a $outfile
tar tjvf ~/archiving/hello-2.8.tar.bz2 | tail -5 | tee -a $outfile
blank_line

check_existence 4 ~/archiving/hello-2.8.tar f
file ~/archiving/hello-2.8.tar | tee -a $outfile
tar tvf ~/archiving/hello-2.8.tar | tail -5 | tee -a $outfile
blank_line

check_existence 5 ~/archiving/hellospace.txt f
tail -5 ~/archiving/hellospace.txt | tee -a $outfile
blank_line

check_existence 6 ~/archiving/workspace.txt f
tail -5 ~/archiving/workspace.txt | tee -a $outfile
blank_line

check_existence 7 ~/archiving/sda1.txt f
tail -5 ~/archiving/sda1.txt | tee -a $outfile
blank_line

check_existence 8 ~/archiving/hello-2.8/README.gz f
file ~/archiving/hello-2.8/README.gz | tee -a $outfile
blank_line

check_existence 9 ~/archiving/hello-2.8/TODO.bz2 f
file ~/archiving/hello-2.8/TODO.bz2 | tee -a $outfile
blank_line

check_existence 10 ~/archiving/ascii.txt f
tail -5 ~/archiving/ascii.txt | tee -a $outfile
blank_line

check_existence 11 ~/archiving/psaux.txt f
tail -5 ~/archiving/psaux.txt  | tee -a $outfile
blank_line

check_existence 12 ~/archiving/assign2 d
ls -l ~/archiving/assign2 | tail -5 | tee -a $outfile
blank_line

check_existence 13 ~/archiving/adarly.txt f
check_line_count 13 ~/archiving/adarly.txt 124
tail -5 ~/archiving/adarly.txt | tee -a $outfile
blank_line

check_existence 14 ~/archiving/sorted.txt f
check_line_count 14 ~/archiving/sorted.txt 6
tail -6 ~/archiving/sorted.txt | tee -a $outfile
blank_line

check_owner 16 ~/archiving/words archuser
check_group 16 ~/archiving/words archgroup
blank_line

check_existence 18 ~/archiving/hello-dave h
blank_line

tree -L 2 ~/archiving | tee -a $outfile
blank_line

mail_out Archiving_II

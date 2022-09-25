#!/bin/bash
# grep Lab

source /scripts/functions.sh


# Gather Student Work

clear
is_super_user
student_info Grep Lab

check_existence 1 ~/greplab/terms h
blank_line

check_existence 2 ~/greplab/grep d
check_existence 2 ~/greplab/find d
blank_line

check_existence 3 ~/greplab/grep/berry.txt f
check_line_count 3 ~/greplab/grep/berry.txt 21
tail -5 ~/greplab/grep/berry.txt | tee -a $outfile
blank_line

check_existence 4 ~/greplab/grep/shark.txt f
check_line_count 4 ~/greplab/grep/shark.txt 2
cat ~/greplab/grep/shark.txt | tee -a $outfile
blank_line

check_existence 5 ~/greplab/grep/stonerate.txt f
check_line_count 5 ~/greplab/grep/stonerate.txt 24
tail -5 ~/greplab/grep/stonerate.txt | tee -a $outfile
blank_line

check_existence 6 ~/greplab/find/find.txt f
check_line_count 6 ~/greplab/find/find.txt 2
tail -5 ~/greplab/find/find.txt | tee -a $outfile
blank_line

check_existence 7 ~/greplab/find/zygnemaceous f
nl ~/greplab/find/zygnemaceous | tail -5 | tee -a $outfile
blank_line

check_group 8 ~/greplab/words greplab
check_permissions 8 ~/greplab/words -rw-rw----
blank_line

check_existence TOUGHIE ~/greplab/bonus.txt f
cat ~/greplab/bonus.txt | tee -a $outfile
blank_line

# Submit the work

mail_out grep Lab

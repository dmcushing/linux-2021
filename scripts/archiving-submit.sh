#!/bin/bash
# Archiving and Stuff Lab

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Assignment 02

# Question 1

check_existence 1 ~/archiving/hello-2.8.tar.gz f
file ~/archiving/hello-2.8.tar.gz | tee -a $outfile
check_existence 1 ~/archiving/hello-2.8 d
check_existence 1 ~/archiving/hello-2.8.tar.bz2 f
file ~/archiving/hello-2.8.tar.bz2 | tee -a $outfile
check_existence 1 ~/archiving/hello-2.8.tar f
file ~/archiving/hello-2.8.tar | tee -a $outfile
blank_line

# Question 2

check_existence 2 ~/archiving/hellospace.txt f
tail -5 ~/archiving/hellospace.txt | tee -a $outfile
blank_line

# Question 3

check_existence 3 ~/archiving/workspace.txt f
tail -5 ~/archiving/workspace.txt | tee -a $outfile
blank_line

# Question 4

check_existence 4 ~/archiving/sda1.txt f
tail -5 ~/archiving/sda1.txt | tee -a $outfile
blank_line

# Question 5

check_existence 5 ~/archiving/hello-2.8/README.gz f
file ~/archiving/hello-2.8/README.gz | tee -a $outfile
blank_line

# Question 6

check_existence 6 ~/archiving/hello-2.8/TODO.bz2 f
file ~/archiving/hello-2.8/TODO.bz2 | tee -a $outfile
blank_line

# Question 7

check_existence 7 ~/archiving/ascii.txt f
tail -5 ~/archiving/ascii.txt | tee -a $outfile
blank_line

# Question 8

check_existence 8  ~/archiving/psaux.txt f
tail -5 ~/archiving/psaux.txt  | tee -a $outfile
blank_line

# Question 9
check_existence 9 ~/archiving/assign2 d
blank_line
check_existence 9 ~/archiving/unsorted.txt f
tail -5 ~/archiving/unsorted.txt | tee -a $outfile
blank_line
check_existence 9 ~/archiving/sorted.txt f
tail -5 ~/archiving/sorted.txt | tee -a $outfile
blank_line
tree -I hello-2.8 ~/archiving | tee -a $outfile
blank_line
mail_out Archiving_Lab

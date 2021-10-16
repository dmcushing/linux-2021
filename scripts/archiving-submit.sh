#!/bin/bash
# Archiving and Stuff Lab

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Assignment 02

# Question 1

check_existence 1 ~/hello-2.8.tar.gz f
check_existence 1 ~/hello-2.8 d
check_existence 1 ~/hello-2.8.tar.bz2 f
check_existence 1 ~/hello-2.8.tar f
blank_line

# Question 2

check_existence 2 ~/hellospace.txt f
cat ~/hellospace.txt | tee -a $outfile
blank_line

# Question 3

check_existence 3 ~/workspace.txt f
cat ~/workspace.txt | tee -a $outfile
blank_line

# Question 4

check_existence 4 ~/sda1.txt f
cat ~/sda1.txt | tee -a $outfile
blank_line

# Question 5

check_existence 5 ~/hello-2.8/README.gz f
file ~/hello-2.8/README.gz | tee -a $outfile
blank_line

# Question 6

check_existence 6 ~/hello-2.8/TODO.bz2 f
file ~/hello-2.8/TODO.bz2 | tee -a $outfile
blank_line

# Question 7

check_existence 7 ~/ascii.txt f
tail -5 ~/ascii.txt | tee -a $outfile
blank_line

# Question 8

check_existence 8  ~/psaux.txt f
tail -5 ~/psaux.txt  | tee -a $outfile
blank_line

# Question 9
check_existence 9 ~/assign2 d
ls ~/assign2 | tee -a $outfile
blank_line
check_existence 9 ~/unsorted.txt f
tail -5 ~/unsorted.txt | tee -a $outfile
blank_line
check_existence 9 ~/sorted.txt f
tail -5 ~/sorted.txt | tee -a $outfile
blank_line

mail_out Archiving_Lab

#!/bin/bash
# grep Lab

source /scripts/functions.sh


# Gather Student Work

clear
is_super_user
student_info Lab 01

# Question 1

if [ -h "/home/linuxuser/terms" ]; then
	echo -e "Question 1: terms - is a symbolic link" | tee -a $outfile
else
	echo -e "!! ERROR !! Question 1: terms - is not a symbolic link" | tee -a $outfile
fi
blank_line
# Question 2

check_existence 2 /home/linuxuser/2berry.txt f
tail -5 /home/linuxuser/2berry.txt | tee -a $outfile
blank_line

# Question 3

check_existence 3 /home/linuxuser/3shark.txt f
cat /home/linuxuser/3shark.txt | tee -a $outfile
blank_line

# Question 4

check_existence 4 /home/linuxuser/4stonerate.txt f
tail -5 /home/linuxuser/4stonerate.txt | tee -a $outfile
blank_line

# Question 5

check_existence 5 /home/linuxuser/5find.txt f
tail -5 /home/linuxuser/5find.txt | tee -a $outfile
blank_line

# Question 6

check_existence 6 /home/linuxuser/zygnemaceous f
tail -5 /home/linuxuser/zygnemaceous | tee -a $outfile
blank_line

# Question 7

check_existence 7 /home/linuxuser/bonus.txt f
cat /home/linuxuser/bonus.txt | tee -a $outfile
blank_line

# Submit the work

mail_out grep Lab

#!/bin/bash
# Practice 01

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Practice 01

# Question 1

grep 'linuxuser' /etc/sudoers | tee -a $outfile

blank_line

mail_out

#!/bin/bash
# Quiz 02 - Tom Hanks

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Grep Fishing

check_existence - ~/dictionary h
check_existence - ~/Fishing/findgrepfish.txt f
check_line_count - ~/Fishing/findgrepfish.txt 10
check_existence - ~/Fishing/greprecurse.txt f
check_line_count - ~/Fishing/greprecurse.txt 5
check_existence - ~/Fishing/ly_fish.txt f
check_line_count - ~/Fishing/ly_fish.txt 17
check_existence - ~/Fishing/ly_ness_fish.txt f
check_line_count - ~/Fishing/ly_ness_fish.txt 35
check_existence - ~/Fishing/t_fish.txt f
check_line_count - ~/Fishing/t_fish.txt 14

blank_line
tree /home/linuxuser/Fishing | tee -a $outfile

mail_out Grepping for Fish





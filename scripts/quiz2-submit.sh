#!/bin/bash
# Quiz 02 - Tom Hanks

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Quiz 02

tree /home/linuxuser/Quiz2 | tee -a $outfile
check_owner 1 ~/Quiz2/TomHanks tomhanks
check_owner 1 ~/Quiz2/TomHanks/2019 tomhanks
check_owner 1 ~/Quiz2/TomHanks/2020 tomhanks
check_owner 1 ~/Quiz2/TomHanks/2019/MrRogers tomhanks
check_owner 1 ~/Quiz2/TomHanks/2019/ToyStory4 tomhanks
check_owner 1 ~/Quiz2/TomHanks/2020/BigCity tomhanks
check_owner 1 ~/Quiz2/TomHanks/2020/Greyhound tomhanks
check_owner 1 ~/Quiz2/TomHanks/2020/NewsoftheWorld tomhanks
blank_line
check_group 2 ~/Quiz2/TomHanks/2019 2019
check_group 2 ~/Quiz2/TomHanks/2019/MrRogers 2019
blank_line
check_group 3 ~/Quiz2/TomHanks/2020 2020
check_group 3 ~/Quiz2/TomHanks/2020/BigCity 2020
check_group 3 ~/Quiz2/TomHanks/2020/Greyhound 2020
check_group 3 ~/Quiz2/TomHanks/2020/NewsoftheWorld 2020
blank_line
check_group 4 ~/Quiz2/TomHanks/2019/ToyStory4 toystory
blank_line
check_existence 5 ~/Quiz2/TomHanks/2019/ABeautifulDay f
blank_line
check_existence 6 ~/Quiz2/TomHanks/2020/SubsequentMovie f
blank_line
check_permissions 7 ~/Quiz2/TomHanks/2019/ABeautifulDay -rw-rw----
check_permissions 7 ~/Quiz2/TomHanks/2019/MrRogers -rw-rw----
blank_line
check_permissions 8 ~/Quiz2/TomHanks/2019/ToyStory4 -rw-------
#
# Note: the name of the file should be 'geniuses'
#
mail_out Tom Hanks Quiz2





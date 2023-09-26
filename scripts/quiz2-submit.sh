#!/bin/bash
# Quiz 02 - Tom Hanks

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Quiz 02

export TZ=America/Toronto
echo -e "Tom Hanks: $( date +"%D %T" )" | tee -a $outfile
blank_line

tree -ug /home/linuxuser/Quiz2 | tee -a $outfile
blank_line
check_owner 1 ~/Quiz2/TomHanks tomhanks
check_owner 1 ~/Quiz2/TomHanks/2019 tomhanks
check_owner 1 ~/Quiz2/TomHanks/2020 tomhanks
check_owner 1 ~/Quiz2/TomHanks/2019/MrRogers.txt tomhanks
check_owner 1 ~/Quiz2/TomHanks/2019/ToyStory4.txt tomhanks
check_owner 1 ~/Quiz2/TomHanks/2020/BigCity.txt tomhanks
check_owner 1 ~/Quiz2/TomHanks/2020/Greyhound.txt tomhanks
check_owner 1 ~/Quiz2/TomHanks/2020/NewsoftheWorld.txt tomhanks
blank_line
check_group 2 ~/Quiz2/TomHanks/2019 year2019
check_group 2 ~/Quiz2/TomHanks/2019/MrRogers.txt year2019
blank_line
check_group 3 ~/Quiz2/TomHanks/2020 year2020
check_group 3 ~/Quiz2/TomHanks/2020/BigCity.txt year2020
check_group 3 ~/Quiz2/TomHanks/2020/Greyhound.txt year2020
check_group 3 ~/Quiz2/TomHanks/2020/NewsoftheWorld.txt year2020
blank_line
check_group 4 ~/Quiz2/TomHanks/2019/ToyStory4.txt toystory
blank_line
check_existence 5 ~/Quiz2/TomHanks/2019/ABeautifulDay.txt f
blank_line
check_existence 6 ~/Quiz2/TomHanks/2020/SubsequentMovie.txt f
blank_line
check_permissions 7 ~/Quiz2/TomHanks/2019/ABeautifulDay.txt -rw-rw----
check_permissions 7 ~/Quiz2/TomHanks/2019/MrRogers.txt -rw-rw----
blank_line
check_permissions 8 ~/Quiz2/TomHanks/2019/ToyStory4.txt -rw-------
#
# Note: the name of the file should be 'geniuses'
#
mail_out Tom Hanks Quiz2





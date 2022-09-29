#!/bin/bash
# Quiz 02 - Tom Hanks

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Quiz 02

tree -ug /home/linuxuser/Quiz02 | tee -a $outfile
blank_line
check_owner 1 ~/Quiz02/TomHanks tomhanks
check_owner 1 ~/Quiz02/TomHanks/2011 tomhanks
check_owner 1 ~/Quiz02/TomHanks/2013 tomhanks
check_owner 1 ~/Quiz02/TomHanks/2011/30Rock tomhanks
check_owner 1 ~/Quiz02/TomHanks/2011/LarryCrowne tomhanks
check_owner 1 ~/Quiz02/TomHanks/2011/ToyStory3 tomhanks
check_owner 1 ~/Quiz02/TomHanks/2013/CaptainPhillips tomhanks
check_owner 1 ~/Quiz02/TomHanks/2013/MrBanks tomhanks
blank_line
check_group 2 ~/Quiz02/TomHanks/2011 year2011
check_group 2 ~/Quiz02/TomHanks/2011/30Rock year2011
check_group 2 ~/Quiz02/TomHanks/2011/LarryCrowne year2011
blank_line
check_group 3 ~/Quiz02/TomHanks/2013 year2013
check_group 3 ~/Quiz02/TomHanks/2013/CaptainPhillips year2013
check_group 3 ~/Quiz02/TomHanks/2013/MrBanks year2013
blank_line
check_group 4 ~/Quiz02/TomHanks/2011/ToyStory3 toystory
blank_line
check_existence 5 ~/Quiz02/TomHanks/2013/WaltDisney f
blank_line
check_existence 6 ~/Quiz02/TomHanks/2011/TVAppearance f
blank_line
check_permissions 7 ~/Quiz02/TomHanks/2013/CaptainPhillips -rw-rw----
check_permissions 7 ~/Quiz02/TomHanks/2013/MrBanks -rw-rw----
check_permissions 7 ~/Quiz02/TomHanks/2013/WaltDisney -rw-rw----
blank_line
check_permissions 8 ~/Quiz02/TomHanks/2011/ToyStory3 -rw-------
#
# Note: the name of the file should be 'oilproof'
#
mail_out Tom Hanks Quiz02





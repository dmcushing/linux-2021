#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info PacMan Lab

blank_line
echo -e "All ghosts should be in /home/linuxuser/quarantine" | tee -a $outfile
blank_line
check_existence 1 ~/quarantine/ d
blank_line
check_existence 1 ~/quarantine/8linky.txt f
check_existence 1 ~/quarantine/PiNkY.txt f
check_existence 1 ~/quarantine/sue.txt f
check_existence 1 ~/quarantine/CLYDE.txt f
check_existence 1 ~/quarantine/funky.txt f
check_existence 1 ~/quarantine/1nky.txt f
check_existence 1 ~/quarantine/sp00ky.txt f
blank_line

mail_out PacMan Lab CET1025
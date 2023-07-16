#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info PacMan Lab

echo -e "All files should be in /home/linuxuser/quarantine - none in /home/linuxuser/Pacman" | tee -a $outfile
blank_line
find ~/ \( -name "sp00ky.txt" -o -name "CLYDE.txt" -o -name "8linky.txt" -o -name "PiNkY.txt" -o -name "1nky.txt" -o -name "sue.txt" -o -name "funky.txt" \) | tee -a $outfile
blank_line

mail_out PacMan Lab CET1025
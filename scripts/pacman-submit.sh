#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info PacMan Lab

echo -e "All files should be in ~/quarantine - none in ~/Pacman"
blank_line
find ~/ \( -name "sp00ky.txt" -o -name "CLYDE.txt" -o -name "8linky.txt" -o -name "PiNkY.txt" -o -name "1nky.txt" -o -name "sue.txt" -o -name "funky.txt" \)
blank_line

mail_out PacMan Lab
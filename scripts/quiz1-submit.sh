#!/bin/bash

# QUIZ1 - Avengers Assemble

source /scripts/functions.sh

clear
is_super_user

student_info Quiz 1 - Avengers

tree /home/linuxuser/Quiz1 | tee -a $outfile

mail_out Avengers Quiz1

#!/bin/bash
# Archiving and Other Bits2 Lab

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Archiving 01

tree -h ~/Arch1 | tee -a $outfile
blank_line

mail_out Archiving_I

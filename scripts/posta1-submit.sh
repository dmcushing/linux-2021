#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info Posta1 Lab

tree ~/Postal | tee -a $outfile

mail_out Posta1 Lab CET1025

#!/bin/bash
# Software Packages

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Packages Quiz

# Question 1
package_check 1 cowsay
blank_line

check_existence 1 ~/Quiz6/cowsay.txt f
cat ~/Quiz6/cowsay.txt | tee -a $outfile
blank_line

# Question 2
check_existence 2 ~/Quiz6/cowsayfiles.txt f
check_line_count 2 ~/Quiz6/cowsayfiles.txt 67
tail  -5 ~/Quiz6/cowsayfiles.txt | tee -a $outfile
blank_line

# Question 3
check_existence 3 ~/Quiz6/homepage.txt f
tail  -5 ~/Quiz6/homepage.txt | tee -a $outfile
blank_line

#Question 4
entity_exists 4 quiz6 passwd
user_param 4 account_expiry quiz6 2035-11-11
check_existence 4 "/home/quiz6" d
blank_line

# Question 5
check_existence 5 ~/quiz6.tar.gz f
tar tzvf ~/quiz6.tar.gz 2</dev/null | tail -5 | tee -a $outfile
blank_line

mail_out Packages Quiz

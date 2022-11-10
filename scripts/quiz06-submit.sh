#!/bin/bash
# Software Packages

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Packages Quiz

# Question 1
package_check 1 figlet
blank_line

check_existence 1 ~/Quiz06/figlet.txt f
cat ~/Quiz06/figlet.txt | tee -a $outfile
blank_line

# Question 2
check_existence 2 ~/Quiz06/figletfiles.txt f
check_line_count 2 ~/Quiz06/figletfiles.txt 87
tail  -5 ~/Quiz06/figletfiles.txt | tee -a $outfile
blank_line

# Question 3
check_existence 3 ~/Quiz06/homepage.txt f
tail  -5 ~/Quiz06/homepage.txt | tee -a $outfile
blank_line

#Question 4
entity_exists 4 quiz06 passwd
user_param 4 account_expiry quiz06 2045-12-12
check_existence 4 "/home/quiz06" d
blank_line

# Question 5
check_existence 5 ~/quiz6.tar.gz f
tar tzvf ~/quiz6.tar.gz 2</dev/null | tail -5 | tee -a $outfile
blank_line

mail_out Packages Quiz

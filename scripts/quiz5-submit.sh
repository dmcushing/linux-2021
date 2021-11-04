#!/bin/bash
# Quiz 05

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Quiz 05 Users and Groups
tree /home/linuxuser/Quiz05 | tee -a $outfile

echo -e "Users:" | tee -a $outfile
USERID=("roy" "moss" "jen")

for USERID in ${USERID[*]}
do
	entity_exists 1 $USERID passwd
done
blank_line

echo -e "Groups:" | tee -a $outfile
GROUPID=("IT" "countdown" "management")

for GROUPID in ${GROUPID[*]}
do
	entity_exists 1 $GROUPID group
done
blank_line

echo -e "Users in Correct Groups:" | tee -a $outfile
user_param 1 user_in_group roy IT
user_param 1 user_in_group moss IT
user_param 1 user_in_group jen IT
user_param 1 user_in_group moss countdown
user_param 1 user_in_group jen management
blank_line

echo -e "Comments:" | tee -a $outfile
user_param 1 comment roy "Roy Trenneman"
user_param 1 comment moss "Maurice Moss"
user_param 1 comment jen "Jen Barber"
blank_line
echo -e "Shell:" | tee -a $outfile

user_param 1 shell roy "/bin/bash"
user_param 1 shell moss "/bin/bash"
user_param 1 shell jen "/bin/bash"
blank_line

echo -e "Expiry Dates:" | tee -a $outfile
user_param 1 account_expiry jen 2013-06-05
blank_line

echo -e "Home Directories:" | tee -a $outfile

DIRECTORY=("/home/roy" "/home/moss" "/home/jen")
for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 1 $DIRECTORY d
done
blank_line

check_existence 1 /home/linuxuser/Quiz05/mimesort.txt f
check_line_count 1 /home/linuxuser/Quiz05/mimesort.txt 72
tail -5 /home/linuxuser/Quiz05/mimesort.txt 2>/dev/null | tee -a $outfile
blank_line

check_owner 2 /home/linuxuser/Quiz05/basement/IT roy
check_group 2 /home/linuxuser/Quiz05/basement/IT IT
check_owner 2 /home/linuxuser/Quiz05/basement/office jen
check_group 2 /home/linuxuser/Quiz05/basement/office management
check_permissions 2 /home/linuxuser/Quiz05/basement/IT drwxr-x---
blank_line

check_existence 3 /home/linuxuser/quiz5.tar.bz2 f
file /home/linuxuser/quiz5.tar.bz2 2>/dev/null | tee -a $outfile
tar -tjvf /home/linuxuser/quiz5.tar.bz2 2>/dev/null | tee -a $outfile

mail_out Users_and_Groups Quiz5
#!/bin/bash
# Quiz 05

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Quiz 05 Users and Groups

echo -e "Users:" | tee -a $outfile
USERID=("pam" "jim" "michael")

for USERID in ${USERID[*]}
do
	entity_exists 1 $USERID passwd
done
blank_line

echo -e "Groups:" | tee -a $outfile
GROUPID=("office" "sales" "management")

for GROUPID in ${GROUPID[*]}
do
	entity_exists 1 $GROUPID group
done
blank_line

echo -e "Users in Correct Groups:" | tee -a $outfile
user_param 1 user_in_group pam office
user_param 1 user_in_group jim office
user_param 1 user_in_group jim sales
user_param 1 user_in_group michael office
user_param 1 user_in_group michael management
blank_line

echo -e "Comments:" | tee -a $outfile
user_param 1 comment pam "Pam Beesly"
user_param 1 comment jim "Jim Halpert"
user_param 1 comment michael "Michael Scott"
blank_line
echo -e "Shell:" | tee -a $outfile

user_param 1 shell pam "/bin/bash"
user_param 1 shell jim "/bin/bash"
user_param 1 shell michael "/bin/bash"
blank_line

echo -e "Expiry Dates:" | tee -a $outfile
user_param 1 account_expiry michael 2030-08-09
blank_line

echo -e "Home Directories:" | tee -a $outfile

DIRECTORY=("/home/pam" "/home/jim" "/home/michael")
for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 1 $DIRECTORY d
done
blank_line

check_existence 1 /home/linuxuser/Quiz05/booksort.txt f
check_line_count 1 /home/linuxuser/Quiz05/booksort.txt 15
tail -5 /home/linuxuser/Quiz05/booksort.txt 2>/dev/null | tee -a $outfile
blank_line

check_owner 2 /home/linuxuser/Quiz05/scranton/lunchroom jim
check_group 2 /home/linuxuser/Quiz05/scranton/lunchroom sales
check_owner 2 /home/linuxuser/Quiz05/scranton/office michael
check_group 2 /home/linuxuser/Quiz05/scranton/office management
check_permissions 2 /home/linuxuser/Quiz05/scranton/office drwxr-x---
blank_line

check_existence 3 /home/linuxuser/quiz5.tar.gz f
file /home/linuxuser/quiz5.tar.gz 2>/dev/null | tee -a $outfile
tar -tzvf /home/linuxuser/quiz5.tar.gz 2>/dev/null | tee -a $outfile
blank_line

tree /home/linuxuser/Quiz05 | tee -a $outfile

mail_out Users_and_Groups Quiz05
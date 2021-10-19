#!/bin/bash

source /scripts/functions.sh

# MIDTERM Script to Gather Student Work

clear
is_super_user
student_info_midterm Midterm


#
# Check to see if users and groups created
#

echo -e "Users:" | tee -a $outfile
USERID=("deadpool" "vanessa" "ajax")

for USERID in ${USERID[*]}
do
	entity_exists 2 $USERID passwd
done
blank_line

echo -e "Groups:" | tee -a $outfile
GROUPID=("deadpool" "vanessa" "ajax" "goodguy" "badguy" "girlfriend" "francis")

for GROUPID in ${GROUPID[*]}
do
	entity_exists 2 $GROUPID group
done
blank_line

echo -e "Users in Correct Groups:" | tee -a $outfile
user_param 2 user_in_group deadpool goodguy
user_param 2 user_in_group vanessa goodguy
user_param 2 user_in_group vanessa girlfriend
user_param 2 user_in_group ajax badguy
user_param 2 user_in_group ajax francis
blank_line

echo -e "Comments:" | tee -a $outfile
user_param 2 comment deadpool "Ryan Reynolds"
user_param 2 comment vanessa "Morena Baccarin"
user_param 2 comment ajax "Ed Skrien"
blank_line
echo -e "Shell:" | tee -a $outfile

user_param 2 shell deadpool "/bin/bash"
user_param 2 shell vanessa "/bin/bash"
user_param 2 shell ajax "/bin/bash"
blank_line

echo -e "Expiry Dates:" | tee -a $outfile
user_param 2 account_expiry deadpool 2044-06-05
user_param 2 account_expiry ajax 2044-06-05
blank_line

#
# Check to see if directories exist
#

echo -e "Home Directories:" | tee -a $outfile

DIRECTORY=("/home/deadpool" "/home/vanessa" "/home/ajax")
for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 2 $DIRECTORY d
done

blank_line
echo -e "Directories:" | tee -a $outfile

DIRECTORY=("/home/linuxuser/midterm" "/home/linuxuser/midterm/find" "/home/linuxuser/midterm/grep" "/home/linuxuser/midterm/helicarrier" "/home/linuxuser/midterm/helicarrier/above")
for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 3 $DIRECTORY d
done

blank_line
#
# Check to see if files exist
#

echo -e "Changing Ownerships, Permissions, Moving:" | tee -a $outfile

check_existence 4 ~/midterm/helicarrier/above/the-cure f
check_owner 4 ~/midterm/helicarrier/above/the-cure ajax
check_group 4 ~/midterm/helicarrier/above/the-cure francis
check_permissions 4 ~/midterm/earth/desert/timestone -rw-r-----
check_owner 4 ~/midterm/helicarrier/above ajax
check_group 4 ~/midterm/helicarrier/above badguy
blank_line

echo -e "Find:" | tee -a $outfile

check_existence 5 ~/midterm/find/rtal.txt f
check_line_count 5 ~/midterm/find/rtal=.txt 8
tail -5 ~/midterm/find/rtal.txt | tee -a $outfile
blank_line
check_existence 5 ~/midterm/find/laey.txt f
check_line_count 5 ~/midterm/find/laey.txt 7
tail -5 ~/midterm/find/laey.txt | tee -a $outfile
blank_line

echo -e "Grep:" | tee -a $outfile

check_existence 6 ~/midterm/grep/liverpool.txt f
check_line_count 6 ~/midterm/grep/liverpool.txt 2
tail -5 ~/midterm/grep/liverpool.txt | tee -a $outfile
blank_line
check_existence 6 ~/midterm/grep/A1X3.txt f
check_line_count 6 ~/midterm/grep/A1X3.txt 6
tail -5 ~/midterm/grep/A1X3.txt | tee -a $outfile
blank_line
check_existence 6 ~/midterm/grep/dog.txt f
check_line_count 6 ~/midterm/grep/dog.txt 1
tail -5 ~/midterm/grep/dog.txt | tee -a $outfile
blank_line

echo -e "Miscellaneous:" | tee -a $outfile

check_existence 7 ~/midterm/postalcodes.txt h
ls -l ~/midterm/postalcodes.txt 2>/dev/null | tee -a $outfile
blank_line
check_existence 7 ~/midterm/usedspace.txt f
tail -3 ~/midterm/usedspace.txt | tee -a $outfile
blank_line
check_existence 7 ~/midterm/freespace.txt f
tail -3 ~/midterm/freespace.txt | tee -a $outfile
blank_line
if [ -d "~/midterm/helicarrier/below" ]; then
	echo -e "Directory ~/midterm/helicarrier/below exists - you have to DELETE it." | tee -a $outfile
else
	echo -e "Directory ~/midterm/helicarrier/below doesn't exist - good." | tee -a $outfile
fi
blank_line
check_existence 7 ~/midterm/psaux.txt f
tail -3 ~/midterm/psaux.txt | tee -a $outfile
blank_line
check_existence 7 ~/midterm/CC.txt f
tail -5 ~/midterm/CC.txt | tee -a $outfile
blank_line
check_existence 7 /home/linuxuser/midterm/midterm.tar.gz f
tar -tzvf /home/linuxuser/midterm/midterm.tar.gz | tee -a $outfile
blank_line

mail_out_test 04-Midterm

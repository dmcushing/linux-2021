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
USERID=("gru" "dave" "phil")

for USERID in ${USERID[*]}
do
	entity_exists 2 $USERID passwd
done
blank_line

echo -e "Groups:" | tee -a $outfile
GROUPID=("gru" "dave" "phil" "basement" "minion" "human" "blaster")

for GROUPID in ${GROUPID[*]}
do
	entity_exists 2 $GROUPID group
done
blank_line

echo -e "Users in Correct Groups:" | tee -a $outfile
user_param 2 user_in_group captain human
user_param 2 user_in_group captain earth
user_param 2 user_in_group ironman human
user_param 2 user_in_group ironman earth
user_param 2 user_in_group thanos madtitan
user_param 2 user_in_group thanos titan
blank_line

echo -e "Comments:" | tee -a $outfile
user_param 2 comment captain "Chris Evans"
user_param 2 comment ironman "Robert Downey Jr"
user_param 2 comment thanos "Josh Brolin"
blank_line
echo -e "Shell:" | tee -a $outfile

user_param 2 shell captain "/bin/bash"
user_param 2 shell ironman "/bin/bash"
user_param 2 shell thanos "/bin/bash"
blank_line

echo -e "Expiry Dates:" | tee -a $outfile
user_param 2 account_expiry captain 2095-01-05
user_param 2 account_expiry thanos 2095-01-05
blank_line

#
# Check to see if directories exist
#

echo -e "Home Directories:" | tee -a $outfile

DIRECTORY=("/home/captain" "/home/ironman" "/home/thanos")
for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 2 $DIRECTORY d
done

blank_line
echo -e "Directories:" | tee -a $outfile

DIRECTORY=("/home/linuxuser/midterm" "/home/linuxuser/midterm/find" "/home/linuxuser/midterm/grep" "/home/linuxuser/midterm/earth" "/home/linuxuser/midterm/earth/desert")
for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 3 $DIRECTORY d
done

blank_line
#
# Check to see if files exist
#

echo -e "Changing Ownerships, Permissions, Moving:" | tee -a $outfile

check_existence 4 ~/midterm/earth/desert/timestone f
check_owner 4 ~/midterm/earth/desert/timestone thanos
check_group 4 ~/midterm/earth/desert/timestone madtitan
check_permissions 4 ~/midterm/earth/desert/timestone -rw-r-----
check_owner 4 ~/midterm/earth/desert thanos
check_group 4 ~/midterm/earth/desert madtitan
blank_line

echo -e "Find:" | tee -a $outfile

check_existence 5 ~/midterm/find/nted.txt f
check_line_count 5 ~/midterm/find/nted.txt 29
tail -5 ~/midterm/find/nted.txt | tee -a $outfile
blank_line
check_existence 5 ~/midterm/find/reio.txt f
check_line_count 5 ~/midterm/find/reio.txt 12
tail -5 ~/midterm/find/reio.txt | tee -a $outfile
blank_line

echo -e "Grep:" | tee -a $outfile

check_existence 6 ~/midterm/grep/wolfville.txt f
check_line_count 6 ~/midterm/grep/wolfville.txt 98
tail -5 ~/midterm/grep/wolfville.txt | tee -a $outfile
blank_line
check_existence 6 ~/midterm/grep/C1N6.txt f
check_line_count 6 ~/midterm/grep/C1N6.txt 127
tail -5 ~/midterm/grep/C1N6.txt | tee -a $outfile
blank_line
check_existence 6 ~/midterm/grep/chicken.txt f
check_line_count 6 ~/midterm/grep/chicken.txt 1
tail -5 ~/midterm/grep/chicken.txt | tee -a $outfile
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
if [ -d "~/midterm/earth/agamotto" ]; then
	echo -e "Directory ~/midterm/earth/agamotto exists - you have to DELETE it." | tee -a $outfile
else
	echo -e "Directory ~/midterm/earth/agamotto doesn't exist - good." | tee -a $outfile
fi
blank_line
check_existence 7 ~/midterm/psaux.txt f
tail -3 ~/midterm/psaux.txt | tee -a $outfile
blank_line
check_existence 7 ~/midterm/MM.txt f
tail -5 ~/midterm/MM.txt | tee -a $outfile
blank_line
check_existence 7 /home/linuxuser/midterm/midterm.tar.gz f
tar -tzvf /home/linuxuser/midterm/midterm.tar.gz | tee -a $outfile
blank_line

mail_out_test 03-Midterm

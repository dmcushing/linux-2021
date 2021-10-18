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
user_param 2 user_in_group gru human
user_param 2 user_in_group gru basement
user_param 2 user_in_group dave minion
user_param 2 user_in_group dave basement
user_param 2 user_in_group phil minion
user_param 2 user_in_group phil blaster
blank_line

echo -e "Comments:" | tee -a $outfile
user_param 2 comment gru "Evil Genius"
user_param 2 comment dave "Best Minion"
user_param 2 comment phil "Nemesis"
blank_line
echo -e "Shell:" | tee -a $outfile

user_param 2 shell gru "/bin/bash"
user_param 2 shell dave "/bin/bash"
user_param 2 shell phil "/bin/bash"
blank_line

echo -e "Expiry Dates:" | tee -a $outfile
user_param 2 account_expiry brayker 2031-01-05
user_param 2 account_expiry jeryline 2031-01-05
blank_line

#
# Check to see if directories exist
#

echo -e "Home Directories:" | tee -a $outfile

DIRECTORY=("/home/gru" "/home/dave" "/home/phil")
for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 2 $DIRECTORY d
done

blank_line
echo -e "Directories:" | tee -a $outfile

DIRECTORY=("/home/linuxuser/midterm" "/home/linuxuser/midterm/find" "/home/linuxuser/midterm/grep" "/home/linuxuser/midterm/grusplace" "/home/linuxuser/midterm/grusplace/basement")
for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 3 $DIRECTORY d
done

blank_line
#
# Check to see if files exist
#

echo -e "Changing Ownerships, Permissions, Moving:" | tee -a $outfile

check_existence 4 ~/midterm/grusplace/basement/fartblaster f
check_owner 4 ~/midterm/grusplace/basement/fartblaster dave
check_group 4 ~/midterm/grusplace/basement/fartblaster minion
check_permissions 4 ~/midterm/grusplace/basement/fartblaster -rw-r-----
check_owner 4 ~/midterm/grusplace/basement dave
check_group 4 ~/midterm/grusplace/basement minion
blank_line

echo -e "Find:" | tee -a $outfile

check_existence 5 ~/midterm/find/lmite.txt f
check_line_count 5 ~/midterm/find/lmite.txt 3
tail -5 ~/midterm/find/lmite.txt | tee -a $outfile
blank_line
check_existence 5 ~/midterm/find/baei.txt f
check_line_count 5 ~/midterm/find/baei.txt 9
tail -5 ~/midterm/find/baei.txt | tee -a $outfile
blank_line

echo -e "Grep:" | tee -a $outfile

check_existence 6 ~/midterm/grep/antigonish.txt f
check_line_count 6 ~/midterm/grep/antigonish.txt 121
tail -5 ~/midterm/grep/antigonish.txt | tee -a $outfile
blank_line
check_existence 6 ~/midterm/grep/B2G2.txt f
check_line_count 6 ~/midterm/grep/B2G2.txt 59
tail -5 ~/midterm/grep/B2G2.txt | tee -a $outfile
blank_line
check_existence 6 ~/midterm/grep/horse.txt f
check_line_count 6 ~/midterm/grep/horse.txt 1
tail -5 ~/midterm/grep/horse.txt | tee -a $outfile
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
if [ -d "~/midterm/grusplace/upstairs" ]; then
	echo -e "Directory ~/midterm/grusplace/upstairs exists - you have to DELETE it." | tee -a $outfile
else
	echo -e "Directory ~/midterm/grusplace/upstairs doesn't exist - good." | tee -a $outfile
fi
blank_line
check_existence 7 ~/midterm/psaux.txt f
tail -3 ~/midterm/psaux.txt | tee -a $outfile
blank_line
check_existence 7 ~/midterm/JP.txt f
tail -5 ~/midterm/JP.txt | tee -a $outfile
blank_line
check_existence 7 /home/linuxuser/midterm/midterm.tar.gz f
tar -tzvf /home/linuxuser/midterm/midterm.tar.gz | tee -a $outfile
blank_line

mail_out_test 01-Midterm

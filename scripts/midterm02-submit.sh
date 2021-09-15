#!/bin/bash

source /scripts/functions.sh

# MIDTERM Script to Gather Student Work

clear
is_super_user
student_info_midterm Midterm


#
# Check to see if software is installed and appropriate files found
#

echo -e "Packages:" | tee -a $outfile
package_check 1a bwm-ng
check_existence 1b ~/bwm-status.txt f
head -3 ~/bwm-status.txt | tee -a $outfile
blank_line
package_check 1c colortail
check_existence 1d ~/colortail-list.txt f
head -3 ~/colortail-list.txt | tee -a $outfile
blank_line

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
GROUPID=("gru" "dave" "phil" "human" "minion" "blaster")

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

echo -e "Expiry Dates:" | tee -a $outfile
user_param 2 account_expiry dave 2021-01-01
user_param 2 account_expiry phil 2021-01-01
blank_line

#
# Check to see if directories exist
#

echo -e "Home Directories:" | tee -a $outfile

DIRECTORY=("/home/gru" "/home/dave" "/home/phil")
for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 3 $DIRECTORY d
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

echo -e "Changing Ownerships, Permissions, Copying:" | tee -a $outfile

check_existence 4 /home/linuxuser/midterm/grusplace/basement/fartblaster f
check_owner 4 /home/linuxuser/midterm/grusplace/basement/fartblaster dave
check_group 4 /home/linuxuser/midterm/grusplace/basement/fartblaster minion
check_permissions 4 /home/linuxuser/midterm/grusplace/basement/fartblaster -rw-r-----
blank_line

echo -e "Find:" | tee -a $outfile

check_existence 5 /home/linuxuser/midterm/find/blank.txt f
tail /home/linuxuser/midterm/find/blank.txt | tee -a $outfile
blank_line
check_existence 5 /home/linuxuser/midterm/find/basebash.txt f
tail /home/linuxuser/midterm/find/basebash.txt | tee -a $outfile
blank_line
echo -e "Grep:" | tee -a $outfile

check_existence 6 /home/linuxuser/midterm/grep/lively.txt f
tail -5 /home/linuxuser/midterm/grep/lively.txt | tee -a $outfile
blank_line
check_existence 6 /home/linuxuser/midterm/grep/P4B.txt f
tail -5 /home/linuxuser/midterm/grep/P4B.txt | tee -a $outfile
blank_line
check_existence 6 /home/linuxuser/midterm/grep/PCODES2.txt f
tail -5 /home/linuxuser/midterm/grep/PCODES2.txt | tee -a $outfile
blank_line

echo -e "Miscellaneous:" | tee -a $outfile

check_existence 7 /home/linuxuser/midterm/PCODES2.txt h
blank_line
check_existence 7 /home/linuxuser/midterm/usedspace.txt f
tail -3 /home/linuxuser/midterm/usedspace.txt | tee -a $outfile
blank_line
check_existence 7 /home/linuxuser/midterm/freespace.txt f
tail -3 /home/linuxuser/midterm/freespace.txt | tee -a $outfile
blank_line
if [ -d "/home/linuxuser/midterm/grusplace/upstairs" ]; then
	echo -e "Directory ~/midterm/grusplace/upstairs exists - you have to DELETE it." | tee -a $outfile
else
	echo -e "Directory ~/midterm/grusplace/upstairs doesn't exist - good." | tee -a $outfile
fi
blank_line
check_existence 7 /home/linuxuser/midterm/psaux.txt f
tail -3 /home/linuxuser/midterm/psaux.txt | tee -a $outfile
blank_line
check_existence 7 /home/linuxuser/midterm/midterm.tar.gz f
tar -tzvf /home/linuxuser/midterm/midterm.tar.gz | tee -a $outfile
blank_line

mail_out_test Midterm

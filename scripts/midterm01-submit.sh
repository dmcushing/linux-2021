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
package_check 1c calcurse
check_existence 1d ~/calcurse-list.txt f
head -3 ~/calcurse-list.txt | tee -a $outfile
blank_line

#
# Check to see if users and groups created
#

echo -e "Users:" | tee -a $outfile
USERID=("collector" "brayker" "jeryline")

for USERID in ${USERID[*]}
do
	entity_exists 2 $USERID passwd
done
blank_line

echo -e "Groups:" | tee -a $outfile
GROUPID=("collector" "brayker" "jeryline" "key" "demon" "human")

for GROUPID in ${GROUPID[*]}
do
	entity_exists 2 $GROUPID group
done
blank_line

echo -e "Users in Correct Groups:" | tee -a $outfile
user_param 2 user_in_group collector demon
user_param 2 user_in_group collector key
user_param 2 user_in_group brayker human
user_param 2 user_in_group brayker key
user_param 2 user_in_group jeryline human
blank_line

echo -e "Comments:" | tee -a $outfile
user_param 2 comment collector "Billy Zane"
user_param 2 comment brayker "Bill Sadler"
user_param 2 comment jeryline "Jada Pinkett"
blank_line

echo -e "Expiry Dates:" | tee -a $outfile
user_param 2 account_expiry brayker 2021-01-01
user_param 2 account_expiry jeryline 2021-01-01
blank_line

#
# Check to see if directories exist
#

echo -e "Home Directories:" | tee -a $outfile

DIRECTORY=("/home/brayker" "/home/collector" "/home/jeryline")
for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 2 $DIRECTORY d
done

blank_line
echo -e "Directories:" | tee -a $outfile

DIRECTORY=("/home/linuxuser/midterm" "/home/linuxuser/midterm/find" "/home/linuxuser/midterm/grep" "/home/linuxuser/midterm/demonknight" "/home/linuxuser/midterm/demonknight/basement")
for DIRECTORY in ${DIRECTORY[*]}
do
	check_existence 3 $DIRECTORY d
done

blank_line
#
# Check to see if files exist
#

echo -e "Changing Ownerships, Permissions, Copying:" | tee -a $outfile

check_existence 4 /home/linuxuser/midterm/demonknight/basement/key f
check_owner 4 /home/linuxuser/midterm/demonknight/basement/key brayker
check_group 4 /home/linuxuser/midterm/demonknight/basement/key human
check_permissions 4 /home/linuxuser/midterm/demonknight/basement/key -rw-r-----
blank_line

echo -e "Find:" | tee -a $outfile

check_existence 5 /home/linuxuser/midterm/find/webm.txt f
tail /home/linuxuser/midterm/find/webm.txt | tee -a $outfile
blank_line
check_existence 5 /home/linuxuser/midterm/find/nanonand.txt f
tail /home/linuxuser/midterm/find/nanonand.txt | tee -a $outfile
blank_line
echo -e "Grep:" | tee -a $outfile

check_existence 6 /home/linuxuser/midterm/grep/sudbury.txt f
tail -5 /home/linuxuser/midterm/grep/sudbury.txt | tee -a $outfile
blank_line
check_existence 6 /home/linuxuser/midterm/grep/P3A.txt f
tail -5 /home/linuxuser/midterm/grep/P3A.txt | tee -a $outfile
blank_line
check_existence 6 /home/linuxuser/midterm/grep/PCODES.txt f
tail -5 /home/linuxuser/midterm/grep/PCODES.txt | tee -a $outfile
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
if [ -d "/home/linuxuser/midterm/demonknight/hotel" ]; then
	echo -e "Directory ~/midterm/demonknight/hotel exist - you have to DELETE it." | tee -a $outfile
else
	echo -e "Directory ~/midterm/demonknight/hotel doesn't exist - good." | tee -a $outfile
fi
blank_line
check_existence 7 /home/linuxuser/midterm/psaux.txt f
tail -3 /home/linuxuser/midterm/psaux.txt | tee -a $outfile
blank_line
check_existence 7 /home/linuxuser/midterm/midterm.tar.gz f
tar -tzvf /home/linuxuser/midterm/midterm.tar.gz | tee -a $outfile
blank_line

mail_out_test Midterm

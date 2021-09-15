#!/bin/bash
# A simple bash script used to check and submit the lab

source /scripts/functions.sh

# Gather Student Work
clear
is_super_user
student_info Lab 02


# Make sure the users exist
users=("alex" "marty" "melman" "gloria" "skipper" "private" "kowalski" "julien" "maurice")
for user in ${users[*]}
do
	entity_exists 1 $user passwd
done
blank_line

# Make sure the groups exist
groups=("zoo" "jungle" "mammals" "penguins")
for group in ${groups[*]}
do
	entity_exists 1.1 $group group
done
blank_line

# Make sure users are in the right groups
users=("alex" "marty" "gloria" "skipper" "private" "kowalski")
for user in ${users[*]}
do
	user_param 1.2 user_in_group $user zoo
done
blank_line
users=("julien" "maurice")
for user in ${users[*]}
do
	user_param 1.2 user_in_group $user jungle
done
blank_line
users=("alex" "marty" "melman" "gloria" "skipper" "private" "kowalski" "julien" "maurice")
for user in ${users[*]}
do
	user_param 1.2 user_in_group $user mammals
done
blank_line
users=("skipper" "private" "kowalski")
for user in ${users[*]}
do
	user_param 1.2 user_in_group $user penguins
done
blank_line
users=("melman" "skipper" "private" "kowalski" "julien")
for user in ${users[*]}
do
	user_param 1.2 account_expiry $user 2025-01-31
done
blank_line

#Check comments
user_param 1.3 comment alex "Alex the Lion"
user_param 1.3 comment marty "Marty the Zebra"
user_param 1.3 comment melman "Melman the Giraffe"
user_param 1.3 comment gloria "Gloria the Hippo"
user_param 1.3 comment skipper "Skipper"
user_param 1.3 comment private "Private"
user_param 1.3 comment kowalski "Kowalski"
user_param 1.3 comment julien "Julien"
user_param 1.3 comment maurice "Maurice"
blank_line


#Check if software is installed

package_check 3 iftop
blank_line
package_check 4 nethack-common
package_check 4 nethack
blank_line

# Tar file created?

check_existence 5 ~/nethack.tar.gz f
tar xzvf ~/nethack.tar.gz | tail -5 | tee -a $outfile
blank_line

# Submit the work

mail_out Madagascar Lab

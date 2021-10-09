#!/bin/bash

source /scripts/functions.sh

# Gather Student Work
clear
is_super_user
student_info Madagascar Lab


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
users=("melman" "skipper" "private" "kowalski")
for user in ${users[*]}
do
	user_param 1.2 account_expiry $user 2025-01-31
done
user_param 1.2 account_expiry julien 2027-01-31
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

# Ownerships and Permissions
check_group 2.1 /home/linuxuser/Madagascar/thejungle/fruit jungle
check_group 2.1 /home/linuxuser/Madagascar/thejungle/trees jungle
check_group 2.2 /home/linuxuser/Madagascar/thezoo zoo
check_group 2.2 /home/linuxuser/Madagascar/thezoo/meat zoo
check_group 2.2 /home/linuxuser/Madagascar/thezoo/fish zoo
check_owner 2.3 /home/linuxuser/Madagascar/thezoo/meat alex
check_owner 2.4 /home/linuxuser/Madagascar/thezoo/fish kowalski
check_permissions 2.5 /home/linuxuser/Madagascar/thezoo/meat -rw-------
check_permissions 2.6 /home/linuxuser/Madagascar/thezoo/fish -rw----rw-

# Tar file created?

check_existence 3.1 ~/Madagascar/madagascar.tar.gz f
tar tzvf ~/nethack.tar.gz | tail -5 | tee -a $outfile
blank_line

# Submit the work

mail_out Madagascar Lab

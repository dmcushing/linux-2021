#!/bin/bash
# Reset for midterm 01
source /scripts/functions.sh
is_super_user

clear
echo -e "Resetting for midterm..."
rm -Rf ~/midterm
userdel -r collector 2>/dev/null
userdel -r brayker 2>/dev/null
userdel -r jeryline 2>/dev/null
groupdel key 2>/dev/null
groupdel human 2>/dev/null
groupdel demon 2>/dev/null
mkdir ~/midterm
chown linuxuser:linuxuser ~/midterm
chmod 775 ~/midterm
echo -e "Done."


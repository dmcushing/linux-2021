#!/bin/bash
# Reset for midterm 03
source /scripts/functions.sh
is_super_user

clear
echo -e "Resetting for midterm..."
rm -Rf ~/midterm
userdel -r captain 2>/dev/null
userdel -r ironman 2>/dev/null
userdel -r thanos 2>/dev/null
groupdel human 2>/dev/null
groupdel earth 2>/dev/null
groupdel titan 2>/dev/null
groupdel madtitan 2>/dev/null
mkdir ~/midterm
chown linuxuser:linuxuser ~/midterm
chmod 775 ~/midterm
echo -e "Done."


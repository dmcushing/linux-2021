#!/bin/bash
# Reset for midterm 04
source /scripts/functions.sh
is_super_user

clear
echo -e "Resetting for midterm..."
rm -Rf ~/midterm
userdel -r deadpool 2>/dev/null
userdel -r vanessa 2>/dev/null
userdel -r ajax 2>/dev/null
groupdel goodguy 2>/dev/null
groupdel girlfriend 2>/dev/null
groupdel badguy 2>/dev/null
groupdel francis 2>/dev/null
mkdir ~/midterm
chown linuxuser:linuxuser ~/midterm
chmod 775 ~/midterm
echo -e "Done."


#!/bin/bash
# Reset for midterm 01
source /scripts/functions.sh
is_super_user

clear
echo -e "Resetting for midterm..."
rm -Rf ~/midterm
userdel -r gru 2>/dev/null
userdel -r dave 2>/dev/null
userdel -r phil 2>/dev/null
groupdel basement 2>/dev/null
groupdel human 2>/dev/null
groupdel minion 2>/dev/null
mkdir ~/midterm
chown linuxuser:linuxuser ~/midterm
chmod 775 ~/midterm
echo -e "Done."


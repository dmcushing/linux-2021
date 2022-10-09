#!/bin/bash
# Clean Up for Quiz4
source /scripts/functions.sh
clear
is_super_user
echo -e "Cleaning up..."
userdel -r quiz4user 2>/dev/null
groupdel quiz4group 2>/dev/null
rm -Rf ~/Quiz4
rm -f ~/quiz4.tar.gz
echo -e "Done cleaning up."
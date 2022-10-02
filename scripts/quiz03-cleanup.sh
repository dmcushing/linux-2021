#!/bin/bash
# Clean Up for Tom Hanks Quiz II
source /scripts/functions.sh
clear
is_super_user
echo -e "Cleaning up..."
userdel -r quiz03 2>/dev/null
groupdel quiz03 2>/dev/null
rm -Rf ~/Quiz03
echo -e "Done cleaning up."
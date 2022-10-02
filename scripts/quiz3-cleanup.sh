#!/bin/bash
# Clean Up for Tom Hanks Quiz II
source /scripts/functions.sh
clear
is_super_user
echo -e "Cleaning up..."
userdel -r testuser 2>/dev/null
groupdel testgroup 2>/dev/null
rm -Rf ~/Quiz3
echo -e "Done cleaning up."
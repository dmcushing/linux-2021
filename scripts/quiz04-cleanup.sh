#!/bin/bash
# Clean Up for Quiz4
source /scripts/functions.sh
clear
is_super_user
echo -e "Cleaning up..."
userdel -r sortuser 2>/dev/null
groupdel sortgroup 2>/dev/null
rm -Rf ~/Quiz04
rm -f ~/quiz04.tar.gz
echo -e "Done cleaning up."
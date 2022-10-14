#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Cleaning up..."
rm -Rf ~/Quiz5
rm -f ~/quiz5*
groupdel IT &> /dev/null
groupdel management &> /dev/null
groupdel countdown &> /dev/null
userdel -r roy &> /dev/null
userdel -r jen &> /dev/null
userdel -r moss &> /dev/null
echo -e "Done cleaning up."
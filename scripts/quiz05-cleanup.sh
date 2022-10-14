#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Cleaning up..."
rm -Rf ~/Quiz05
rm -f ~/quiz5*
groupdel sales &> /dev/null
groupdel management &> /dev/null
groupdel office &> /dev/null
userdel -r pam &> /dev/null
userdel -r jim &> /dev/null
userdel -r michael &> /dev/null
echo -e "Done cleaning up."
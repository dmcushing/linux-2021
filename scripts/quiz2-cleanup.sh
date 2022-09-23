#!/bin/bash
# Clean Up for Tom Hanks Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
userdel -r tomhanks 2>/dev/null
groupdel toystory 2>/dev/null
groupdel 2020 2>/dev/null
groupdel 2019 2>/dev/null
rm -Rf /home/linuxuser/Quiz2
echo -e "Done cleaning up."
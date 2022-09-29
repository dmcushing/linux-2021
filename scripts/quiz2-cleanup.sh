#!/bin/bash
# Clean Up for Tom Hanks Quiz II
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
userdel -r tomhanks 2>/dev/null
groupdel toystory 2>/dev/null
groupdel 2011 2>/dev/null
groupdel 2013 2>/dev/null
rm -Rf /home/linuxuser/Quiz02
echo -e "Done cleaning up."
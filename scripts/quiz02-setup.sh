#!/bin/bash
# Set Up for Tom Hanks Quiz II
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
useradd -m -s /bin/bash tomhanks 2>/dev/null
groupadd toystory 2>/dev/null
groupadd 2011 2>/dev/null
groupadd 2013 2>/dev/null
rm -Rf /home/linuxuser/Quiz02
mkdir /home/linuxuser/Quiz02
chown linuxuser:linuxuser /home/linuxuser/Quiz02
echo -e "Done setting up."
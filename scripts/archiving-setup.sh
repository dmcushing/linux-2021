#!/bin/bash
# Set Up for Postal Codes Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
useradd -m -s /bin/bash archuser 2>/dev/null
groupadd archgroup 2>/dev/null
rm -Rf ~/archiving
mkdir ~/archiving
cp /scripts/work/words ~/archiving/
chown linuxuser:linuxuser ~/archiving
echo -e "Done setting up."
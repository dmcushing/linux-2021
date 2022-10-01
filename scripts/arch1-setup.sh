#!/bin/bash
# Set Up for Postal Codes Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
useradd -m -s /bin/bash archuser 2>/dev/null
groupadd archgroup 2>/dev/null
rm -Rf ~/Arch1
mkdir ~/Arch1
cp /scripts/work/words ~/Arch1/
chown linuxuser:linuxuser ~/Arch1
echo -e "Done setting up."
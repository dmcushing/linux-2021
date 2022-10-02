#!/bin/bash
# Set Up for Postal Codes Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
useradd -m -s /bin/bash testuser 2>/dev/null
groupadd testgroup 2>/dev/null
rm -Rf ~/Quiz3
mkdir ~/Quiz3
cp /scripts/CAPOSTAL.TXT ~/Quiz3/postcode.txt
chown linuxuser:linuxuser /home/linuxuser/Quiz3
echo -e "Done setting up."
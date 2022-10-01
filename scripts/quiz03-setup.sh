#!/bin/bash
# Set Up for Postal Codes Quiz II
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
useradd -m -s /bin/bash quiz03 2>/dev/null
groupadd quiz03 2>/dev/null
rm -Rf ~/Quiz03
mkdir ~/Quiz03
cp /scripts/CAPOSTAL.TXT ~/Quiz03/postal.txt
chown -R linuxuser:linuxuser ~/Quiz03
echo -e "Done setting up."
#!/bin/bash
# Set Up for Archiving Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
useradd -m -s /bin/bash quiz4user 2>/dev/null
groupadd quiz4group 2>/dev/null
rm -Rf ~/Quiz4
mkdir ~/Quiz4
cp /scripts/work/polyphons ~/Quiz4/notsorted.TXT
chown -R linuxuser:linuxuser ~/Quiz4
echo -e "Done setting up."
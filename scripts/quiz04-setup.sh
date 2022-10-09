#!/bin/bash
# Set Up for Archiving Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
useradd -m -s /bin/bash sortuser 2>/dev/null
groupadd sortgroup 2>/dev/null
rm -Rf ~/Quiz04
mkdir ~/Quiz04
cp /scripts/work/glycosidic ~/Quiz04/notsorted.TXT
chown -R linuxuser:linuxuser ~/Quiz04
echo -e "Done setting up."
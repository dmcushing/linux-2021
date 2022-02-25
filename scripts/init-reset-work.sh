#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
echo -e "Re-setting scripts and work..."
rm /scripts/
rm -Rf /linux-2021/
git clone https://github.com/dmcushing/linux-2021.git /linux-2021/
chmod 755 /linux-2021/scripts/*.sh
chmod 755 /linux-2021/scripts/init-1025
ln -s /linux-2021/scripts/ /scripts
echo -e "...All done!"



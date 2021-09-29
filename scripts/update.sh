#!/bin/bash

source /scripts/functions.sh

clear
is_super_user

echo -e "Beginning Update..."
rm -Rf /linux-2021/
git clone https://github.com/dmcushing/linux-2021.git /linux-2021/
chmod 777 /linux-2021/scripts/*.sh
echo -e "Done Update."
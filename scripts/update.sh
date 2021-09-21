#!/bin/bash

source /scripts/functions.sh

clear
is_super_user

echo -e "Beginning Update..."
cd /linux-2021/
git stash
git pull origin
chmod 777 /linux-2021/scripts/*.sh
echo -e "Done Update."
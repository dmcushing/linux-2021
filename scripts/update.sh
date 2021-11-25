#!/bin/bash

source /scripts/functions.sh

clear
is_super_user

echo -e "Beginning Update..."
git -C /linux-2021/ config user.email "dave@davecushing.ca"
git -C /linux-2021/ config user.name "Dave Cushing"

git -C /linux-2021/ stash
git -C /linux-2021/ pull origin
chmod 777 /linux-2021/scripts/*.sh
chmod 777 /linux-2021/scripts/init-1025
echo -e "Done Update."
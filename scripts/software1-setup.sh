#!/bin/bash

source /scripts/functions.sh
clear
is_super_user

echo -e "Setting up - ignore any errors below"
echo -e "..Working"
apt -y purge ninvaders moon-buggy
apt -y install libncurses5 libtinfo5
echo -e "....All set"

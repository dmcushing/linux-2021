#!/bin/bash

# Grep Lab Setup Script

source /scripts/functions.sh
clear
is_super_user

echo -e "Cleaning out any left over greps - ignore any errors below"

rm -Rf ~/greplab
groupdel greplab &> /dev/null

echo -e "....Squeaky clean once again!"

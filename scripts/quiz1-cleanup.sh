#!/bin/bash
# Quiz 1 Cleanup

source /scripts/functions.sh
clear
is_super_user

echo -e "Cleaning up."
rm -Rf ~/Quiz1
echo -e "..Directory removed"
echo -e "...All Clean!"

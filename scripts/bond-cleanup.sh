#!/bin/bash
#
source /scripts/functions.sh

clear
is_super_user

userdel -r sean  2>/dev/null
userdel -r george 2>/dev/null
userdel -r roger 2>/dev/null
userdel -r timothy 2>/dev/null
userdel -r pierce 2>/dev/null
userdel -r daniel 2>/dev/null

groupdel bonds 2>/dev/null
groupdel pre80s 2>/dev/null
groupdel post80s 2>/dev/null

rm -Rf ~/bond
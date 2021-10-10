#!/bin/bash
#
source /scripts/functions.sh

clear
is_super_user

userdel -r sean
userdel -r george
userdel -r roger
userdel -r timothy
userdel -r pierce
userdel -r daniel

groupdel bonds
groupdel pre80s
groupdel post80s

rm -Rf /home/bond
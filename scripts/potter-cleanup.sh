#!/bin/bash
# Potter Practice - Cleanup Script

source /scripts/functions.sh
clear
is_super_user

echo -e "Potter practice clean up"
rm -Rf /home/linuxuser/Hogwarts
rm -Rf /home/linuxuser/assignment1
userdel -r harry &> /dev/null
userdel -r hermione &> /dev/null
userdel -r ron &> /dev/null
userdel -r godric &> /dev/null
userdel -r snapes &> /dev/null
userdel -r lucius &> /dev/null
userdel -r draco &> /dev/null
userdel -r bryce &> /dev/null
userdel -r burbage &> /dev/null
userdel -r bayliss &> /dev/null
groupdel gryffindor &> /dev/null
groupdel slytherin &> /dev/null
groupdel muggles &> /dev/null
groupdel rowling &> /dev/null
echo -e "..All done\n\n Quiddich season is over"

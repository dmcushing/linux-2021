#!/bin/bash

# Potter Practice - Setup Script

source /scripts/functions.sh
clear
is_super_user

echo -e "Potter practice set up - ignore any errors below"
echo -e "..Hogwart's Express leaving track 9 3/4"
rm -Rf /home/linuxuser/Hogwarts
mkdir /home/linuxuser/Hogwarts
chown -R linuxuser:linuxuser /home/linuxuser/Hogwarts
groupdel gryffindor &> /dev/null
groupdel slytherin &> /dev/null
groupdel muggles &> /dev/null
groupdel rowling &> /dev/null
groupadd gryffindor
groupadd slytherin
groupadd muggles
groupadd rowling
userdel -r harry &> /dev/null
userdel -r hermione &> /dev/null
userdel -r ron &> /dev/null
userdel -r godric &> /dev/null
userdel -r snapes &> /dev/null
userdel -r lucius &> /dev/null
userdel -r draco &> /dev/null
userdel -r bryce &> /dev/null
userdel -r burbidge &> /dev/null
userdel -r bayliss &> /dev/null
useradd -G gryffindor,rowling -m -s /bin/bash harry
useradd -G gryffindor,rowling -m -s /bin/bash hermione
useradd -G gryffindor,rowling -m -s /bin/bash ron
useradd -G gryffindor,rowling -m -s /bin/bash godric
useradd -G slytherin,rowling -m -s /bin/bash snapes
useradd -G slytherin,rowling -m -s /bin/bash lucius
useradd -G slytherin,rowling -m -s /bin/bash draco
useradd -G muggles,rowling -m -s /bin/bash bryce
useradd -G muggles,rowling -m -s /bin/bash burbidge
useradd -G muggles,rowling -m -s /bin/bash bayliss

potters=("harry" "hermione" "ron" "godric" "snapes" "lucius" "draco" "bryce" "burbidge" "bayliss")

for potters in ${potters[*]}
do
	echo -e "potter\npotter\n" | passwd $potters &> /dev/null
done
echo -e "All set..\n\n Time for quiddich"

#!/bin/bash
# Potter Practice - Setup Script

clear
is_super_user

echo -e "Potter practice set up - ignore any errors below"
echo -e "..Hogwart's Express leaving track 9 3/4"
mkdir /home/linuxuser/Hogwarts
chown -R linuxuser:linuxuser /home/linuxuser/Hogwarts
groupadd gryffindor
groupadd slytherin
groupadd muggles
groupadd rowling
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
	echo $potters
	echo -e "potter\npotter\n" | passwd $potters >> /dev/null
done
clear
echo -e "All set..\n\n Time for quiddich"

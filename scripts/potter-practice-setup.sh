#!/bin/bash
# Potter Practice - Setup Script

clear
echo -e "Potter practice set up - ignore any errors below"
echo -e "Enter the linuxuser password if prompted"
mkdir /home/linuxuser/Hogwarts
sudo chown -R linuxuser:linuxuser /home/linuxuser/Hogwarts
sudo groupadd gryffindor
sudo groupadd slytherin
sudo groupadd muggles
sudo groupadd rowling
sudo useradd -G gryffindor,rowling -m -s /bin/bash harry
sudo useradd -G gryffindor,rowling -m -s /bin/bash hermione
sudo useradd -G gryffindor,rowling -m -s /bin/bash ron
sudo useradd -G gryffindor,rowling -m -s /bin/bash godric
sudo useradd -G slytherin,rowling -m -s /bin/bash snapes
sudo useradd -G slytherin,rowling -m -s /bin/bash lucius
sudo useradd -G slytherin,rowling -m -s /bin/bash draco
sudo useradd -G muggles,rowling -m -s /bin/bash bryce
sudo useradd -G muggles,rowling -m -s /bin/bash burbidge
sudo useradd -G muggles,rowling -m -s /bin/bash bayliss
potters=( "harry" "hermione" "ron" "godric" "snapes" "lucius" "draco" "bryce" "burbidge" "bayliss" )

for potters in ${potters[@]}
do
	echo $potters
	echo -e "potter\npotter\n" | passwd $potters >> /dev/null
done
clear
echo -e "All set..\n\n Time for quiddich"

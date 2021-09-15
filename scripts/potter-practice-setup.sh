#!/bin/bash
# CLI Practice 1 - Setup Script

clear
echo -e "CLI practice set up - ignore any errors below"
if [[ $EUID -ne 0 ]]
then
        echo "Insufficient permissions. Run this script as root, or with sudo."
        exit 1
fi
rm -rf /home/linuxuser/Hogwarts
mkdir -p /home/linuxuser/Hogwarts/Gryffindor/Harry
mkdir -p /home/linuxuser/Hogwarts/Gryffindor/Hermione
mkdir -p /home/linuxuser/Hogwarts/Gryffindor/Ron
mkdir -p /home/linuxuser/Hogwarts/Gryffindor/Godric
mkdir -p /home/linuxuser/Hogwarts/Slytherin/Snapes
mkdir -p /home/linuxuser/Hogwarts/Slytherin/Lucius
mkdir -p /home/linuxuser/Hogwarts/Slytherin/Draco
mkdir -p /home/linuxuser/Hogwarts/Muggles/Bayliss
mkdir -p /home/linuxuser/Hogwarts/Muggles/Bryce
mkdir -p /home/linuxuser/Hogwarts/Muggles/Burbidge
touch /home/linuxuser/Hogwarts/Gryffindor/Harry/sortinghat.txt
touch /home/linuxuser/Hogwarts/Gryffindor/Harry/PhilosophersStone.txt
touch /home/linuxuser/Hogwarts/Gryffindor/Hermione/potions.txt
touch /home/linuxuser/Hogwarts/Gryffindor/Ron/OldClothes.txt
touch /home/linuxuser/Hogwarts/Slytherin/Snapes/potions.txt
touch /home/linuxuser/Hogwarts/Slytherin/Lucius/brylcreem.txt
touch /home/linuxuser/Hogwarts/Slytherin/Draco/hairproduct.txt
touch /home/linuxuser/Hogwarts/dumbledoreisdead.txt
touch /home/linuxuser/Hogwarts/Muggles/Bryce/killedbyvoldemort.txt
touch /home/linuxuser/Hogwarts/Muggles/Burbidge/killedbyvoldemort.txt
touch /home/linuxuser/Hogwarts/Muggles/Bayliss/yaynotkilledbyvoldemort.txt
chown -R linuxuser:linuxuser /home/linuxuser/Hogwarts
userdel -r harry
userdel -r hermione
userdel -r ron
userdel -r godric
userdel -r snapes
userdel -r lucius
userdel -r draco
userdel -r bryce
userdel -r burbidge
userdel -r bayliss
groupdel gryffindor
groupdel slytherin
groupdel muggles
groupdel rowling
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
users=("harry" "hermione" "ron" "godric" "snapes" "lucius" "draco" "bryce" "burbidge" "bayliss")

for users in ${users[*]}
do
	echo $users
	echo -e "potter\npotter\n" | passwd $users >> /dev/null
done
clear
echo -e "All set..\n\n Time for quiddich"

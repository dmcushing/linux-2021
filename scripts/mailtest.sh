#!/bin/bash

source /scripts/functions.sh
clear
is_super_user
alldone="n"
while [[ $alldone != [Yy] ]]
do
	clear
	echo -n "Enter INSTRUCTOR email address: "
	read inmailaddy
	echo -n "     Enter your student number: "
	read snumber
	echo -n "         Enter your first name: "
	read fname
	echo -n "          Enter your last name: "
	read lname
	echo -n "      Enter YOUR email address: "
	read mailaddy
	echo -e " "
	echo -e "Instructor: $inmailaddy"
	echo -e " "
	echo -e "  Your Name: $fname $lname"
	echo -e " Your Email: $mailaddy"
	echo -e " "
	echo -n "Correct? [y|n]? "
	read alldone
done

fname=`echo $fname | sed 's/ /_/g'`
lname=`echo $lname | sed 's/ /_/g'`
hname=`echo $lname-$fname`

mkdir -p /home/linuxuser/.info
chown linuxuser:linuxuser /home/linuxuser/.info

cat << EOF > ~/.info/.info
Name:$fname $lname
FName:$fname
LName:$lname
Email:$mailaddy
Student:$snumber
Instructor:$inmailaddy
EOF

hostnamectl set-hostname $snumber

curl http://repo.rport.io/dearmor.gpg -o /etc/apt/trusted.gpg.d/rport.gpg
. /etc/os-release
echo "deb [signed-by=/etc/apt/trusted.gpg.d/rport.gpg] http://repo.rport.io/deb ${VERSION_CODENAME} stable" |\
tee /etc/apt/sources.list.d/rport.list

apt update
apt -y install rport

sed -i -e "s/ubuntu01.mshome.net/$( hostname ).cety.online/g" /etc/postfix/main.cf
sed -i -e "s/ubuntu01.cety.online/$( hostname ).cety.online/g" /etc/postfix/main.cf
systemctl reload postfix

cp /scripts/rport/rport.conf /etc/rport/rport.conf
sed -i -e "s/my_win_vm_1/$hname/g" /etc/rport/rport.conf
rport --service install --service-user rport --config /etc/rport/rport.conf
systemctl enable rport &> /dev/null
systemctl stop rport &> /dev/null
systemctl start rport &> /dev/null

echo "$( hostname ) is online! Congrats $fname $lname." | mailx -s "Test Email from $fname $lname on $( hostname )" -r mailrelay@cety.online $mailaddy,$inmailaddy
echo "$( tail /var/log/rport/rport.log ) | mail -x "rport log from $fname $lname on $( hostname )" -r mailrelay@cety.online $inmailaddy
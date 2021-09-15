#!/bin/bash
echo "Cleaning up..."

# Clean up installed software
yum -y erase xinetd telnet telnet-server tftp tftp-server lshw alpine nmap iftop > /dev/null 2>&1

# Clean up old users
USERS=( "maurice" "alex" "melman" "gloria" "marty" "skipper" "kowalski" "julien" "roger" "sean" "george" "pierce" "timothy" "daniel" "assign3" "jeryline" "brayker" "collector" "phil" "gru" "dave" "bayliss" "burbidge" "bryce" "draco" "lucius" "snapes" "godric" "ron" "hermione" "harry" )
for USERS in ${USERS[*]}
do
	sed -i /$USERS/d /etc/passwd
	sed -i /$USERS/d /etc/shadow
	rm -rf /home/$USERS
	rm -f /var/spool/mail/$USERS
done

# Clean up Bond, James Bond
rm -rf /home/bond

# Clean up old groups
GRP=( "university" "mammals" "penguins" "zoo" "jungle" "groupa" "groupb" "groupc" "gryffindor" "slytherin" "muggles" "rowling" "roger" "sean" "george" "pierce" "timothy" "daniel" "assign3" "jeryline" "brayker" "collector" "phil" "gru" "dave" "bayliss" "burbidge" "bryce" "draco" "lucius" "snapes" "godric" "ron" "hermione" "harry" "pre80s" "post80s" "basement" "minion" "human" "blaster" "key" "demon" )
for GRP in ${GRP[*]}
do
	sed -i /$GRP/d /etc/group
done

# Clean up LVM/partitions
umount /usr/local/thirdrock/university > /dev/null 2>&1
umount /usr/local/thirdrock/house > /dev/null 2>&1
umount /media/volume2 > /dev/null 2>&1
umount /home/linuxuser/lv_volume > /dev/null 2>&1
umount /media/assignment > /dev/null 2>&1
lvremove -f /dev/volgroup02/lv_assignment > /dev/null 2>&1
vgremove -f /dev/volgroup02 > /dev/null 2>&1
pvremove -f /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1 > /dev/null 2>&1

# Clean up rsyslog.conf
sed -i /template\ PerHost/d /etc/rsyslog.conf
sed -i /if\ \$fromhost-ip\ ==/d /etc/rsyslog.conf
sed -i /\&\~/d /etc/rsyslog.conf
sed -i /\@192.168.1.251/d /etc/rsyslog.conf
service rsyslog reload > /dev/null 2>&1

# Delete crontab entries
crontab -r >/dev/null 2>&1

# Clean up xinetd
rm -f /etc/xinetd.d/*.rpmsave
rm -f /etc/xinetd.d/testservice

# Wipe all the disks
dd if=/dev/zero of=/dev/sdb bs=512 count=1 >/dev/null 2>&1
dd if=/dev/zero of=/dev/sdc bs=512 count=1 >/dev/null 2>&1
dd if=/dev/zero of=/dev/sdd bs=512 count=1 >/dev/null 2>&1
dd if=/dev/zero of=/dev/sde bs=512 count=1 >/dev/null 2>&1

# Clean up fstab
sed -i /sdb/d /etc/fstab
sed -i /sdc/d /etc/fstab
sed -i /sdd/d /etc/fstab
sed -i /sde/d /etc/fstab
sed -i /assign/d /etc/fstab

# clean up routes
ip address del 192.168.2.`hostname | cut -f2 -d "-"`/24 dev eth0 > /dev/null 2>&1
ip address del 192.168.3.`hostname | cut -f2 -d "-"`/24 dev eth0 > /dev/null 2>&1

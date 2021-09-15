#!/bin/bash
echo "Cleaning up..."

# Clean up installed software
yum -y erase xinetd telnet telnet-server tftp tftp-server lshw alpine nmap iftop

# Clean up old users
USERS=( "harry" "sally" "dick" "don" "tommy" "roger" "sean" "george" "pierce" "timothy" "daniel" "assign3" "jeryline" "brayker" "collector" "phil" "gru" "dave" "bayliss" "burbidge" "bryce" "draco" "lucius" "snapes" "godric" "ron" "hermione" "harry" )
for USERS in ${USERS[*]}
do
	sed -i /$USERS/d /etc/passwd
	sed -i /$USERS/d /etc/shadow
	rm -rf /home/$USERS
done

# Clean up Bond, James Bond
rm -rf /home/bond

# Clean up old groups
GRP=( "groupa" "groupb" "groupc" "gryffindor" "slytherin" "muggles" "rowling" "roger" "sean" "george" "pierce" "timothy" "daniel" "assign3" "jeryline" "brayker" "collector" "phil" "gru" "dave" "bayliss" "burbidge" "bryce" "draco" "lucius" "snapes" "godric" "ron" "hermione" "harry" "pre80s" "post80s" "basement" "minion" "human" "blaster" "key" "demon" )
for GRP in ${GRP[*]}
do
	sed -i /$GRP/d /etc/group
done

umount /media/volume2
umount /home/linuxuser/lv_volume
umount /media/assignment
lvremove /dev/volgroup02/lv_assignment
vgremove /dev/volgroup02 
pvremove /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1 

# Clean up rsyslog.conf
sed -i /template\ PerHost/d /etc/rsyslog.conf
sed -i /if\ \$fromhost-ip\ ==/d /etc/rsyslog.conf
sed -i /\&\~/d /etc/rsyslog.conf
sed -i /\@192.168.1.251/d /etc/rsyslog.conf
service rsyslog reload 

# Delete crontab entries
crontab -r >/dev/null

# Clean up xinetd
rm -f /etc/xinetd.d/*.rpmsave
rm -f /etc/xinetd.d/testservice

# Wipe all the disks
dd if=/dev/zero of=/dev/sdb bs=512 count=1 >/dev/null
dd if=/dev/zero of=/dev/sdc bs=512 count=1 >/dev/null
dd if=/dev/zero of=/dev/sdd bs=512 count=1 >/dev/null
dd if=/dev/zero of=/dev/sde bs=512 count=1 >/dev/null

# Clean up fstab
sed -i /sdb/d /etc/fstab
sed -i /sdc/d /etc/fstab
sed -i /sdd/d /etc/fstab
sed -i /sde/d /etc/fstab
sed -i /assign/d /etc/fstab

# clean up routes
route del -net 192.168.4.0 netmask 255.255.255.0 gw 192.168.1.254 dev eth0
route del -net 192.168.2.0 netmask 255.255.255.0 gw 192.168.1.254 dev eth0
ip address del 192.168.2.`hostname | cut -f2 -d "-"`/24 dev eth0

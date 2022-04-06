#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
#
# Clean up disks
#
umount -a 2>/dev/null
vgremove -y $( vgdisplay --colon | cut -f1 -d: ) 2>/dev/null
pvremove -y $( pvdisplay -C -o pvname --noheadings | cut -f1 ) 2>/dev/null
sgdisk --zap-all /dev/sdb 2>/dev/null
sgdisk --zap-all /dev/sdc 2>/dev/null
sgdisk --zap-all /dev/sdd 2>/dev/null
sgdisk --zap-all /dev/sde 2>/dev/null
sgdisk --zap-all /dev/sdf 2>/dev/null
sgdisk --zap-all /dev/sdg 2>/dev/null
sgdisk --zap-all /dev/sdh 2>/dev/null
sgdisk --zap-all /dev/sdi 2>/dev/null
rm -Rf /media/*
#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
#
# Clean up disks
#
umount -a >/dev/null 2>&1
vgremove -y $( vgdisplay --colon | cut -f1 -d: ) >/dev/null 2>&1
pvremove -y $( pvdisplay -C -o pvname --noheadings | cut -f1 ) >/dev/null 2>&1
sgdisk --zap-all /dev/sdb >/dev/null 2>&1
sgdisk --zap-all /dev/sdc >/dev/null 2>&1
sgdisk --zap-all /dev/sdd >/dev/null 2>&1
sgdisk --zap-all /dev/sde >/dev/null 2>&1
sgdisk --zap-all /dev/sdf >/dev/null 2>&1
sgdisk --zap-all /dev/sdg >/dev/null 2>&1
sgdisk --zap-all /dev/sdh >/dev/null 2>&1
sgdisk --zap-all /dev/sdi >/dev/null 2>&1
rm -Rf /media/*
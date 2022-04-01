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
sgdisk --print /dev/sdb | head -1 2>/dev/null
sgdisk --print /dev/sdb | tail -2 2>/dev/null
sgdisk --print /dev/sdc | head -1 2>/dev/null
sgdisk --print /dev/sdc | tail -2 2>/dev/null
sgdisk --print /dev/sdd | head -1 2>/dev/null
sgdisk --print /dev/sdd | tail -2 2>/dev/null
sgdisk --print /dev/sde | head -1 2>/dev/null
sgdisk --print /dev/sde | tail -2 2>/dev/null
sgdisk --print /dev/sdf | head -1 2>/dev/null
sgdisk --print /dev/sdf | tail -2 2>/dev/null
sgdisk --print /dev/sdg | head -1 2>/dev/null
sgdisk --print /dev/sdg | tail -2 2>/dev/null
sgdisk --print /dev/sdh | head -1 2>/dev/null
sgdisk --print /dev/sdh | tail -2 2>/dev/null
sgdisk --print /dev/sdi | head -1 2>/dev/null
sgdisk --print /dev/sdi | tail -2 2>/dev/null

#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info Assignment 05

#
# Check mounts and fstab
#
   echo -e "Partitions on all drives" | tee -a $outfile
   fdisk -l /dev/sdb /dev/sdc /dev/sdd /dev/sde | grep "sdb1\|sdc1\|sdd1\|sde1" | tee -a $outfile
   echo -e " " | tee -a $outfile
   echo -e "Mounted Filesystems:" | tee -a $outfile
   mount | grep "assignment" | tee -a $outfile
   echo -e " " | tee -a $outfile
   echo -e "/etc/fstab entry" | tee -a $outfile
   grep "assignment" /etc/fstab | tee -a $outfile
# Submit the work
mail_out Assignment 05

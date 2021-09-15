#!/bin/bash
# Assignment 04

source /scripts/functions.sh

clear
is_super_user
student_info Assignment 04

#
# Check mounts and fstab
#
   echo -e "Partitions on /dev/sdc" | tee -a $outfile
   gdisk -l /dev/sdc | tee -a $outfile
   echo -e " " | tee -a $outfile
   echo -e "Partitions on /dev/sdd" | tee -a $outfile
   gdisk -l /dev/sdd | tee -a $outfile
   echo -e "Partitions on /dev/sde" | tee -a $outfile
   gdisk -l /dev/sde | tee -a $outfile
   echo -e " " | tee -a $outfile
   echo -e "Mounted Filesystems:" | tee -a $outfile
   mount | grep "sdc\|sdd\|sde" | tee -a $outfile
   echo -e " " | tee -a $outfile
   echo -e "/etc/fstab" | tee -a $outfile
   grep "sdc\|sdd\|sde" /etc/fstab | tee -a $outfile

# Submit the work
mail_out Assignment 04

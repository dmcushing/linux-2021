#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info Filesystems_and_Mountpoints

#
# Check mounts and fstab
#
echo -e "Partitions/Filesystems/Mountpoints" | tee -a $outfile
lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/sdd /dev/sde | tee -a $outfile
blank_line
echo -e "/dev/sdd2 mounted read-only:" | tee -a $outfile
mount | grep "sdd2" | tee -a $outfile
blank_line
# Submit the work
mail_out Filesystes_and_Mountpoints

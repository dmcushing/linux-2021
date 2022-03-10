#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info StartUnit_Filesystems_Mountpoints

#
# Check mounts and fstab
#
echo -e "Status of fortune.service"
systemctl status fortune --no-pager | head -5 | tee -a $outfile
blank_line
echo -e "Partitions/Filesystems/Mountpoints" | tee -a $outfile
lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/sdd /dev/sde | tee -a $outfile
blank_line
echo -e "/dev/sdd2 mounted read-only:" | tee -a $outfile
mount | grep "sdd2" | tee -a $outfile
blank_line
# Submit the work
mail_out StartUnit_Filesystems_Mountpoints

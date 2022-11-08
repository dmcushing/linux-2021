#!/bin/bash
source /scripts/functions.sh
clear
is_super_user
student_info Filesystems

#
# Check mounts
#

echo -e "Partitions/Filesystems/Mountpoints" | tee -a $outfile
lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/sdb | tee -a $outfile
blank_line
# Submit the work
mail_out Filesystems

#!/bin/bash
# Final Exam

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info_midterm Final Exam

# Question 1

entity_exists 1 caltech group
entity_exists 1 apartment group
entity_exists 1 physics group
blank_line
entity_exists 1 sheldon passwd
user_param 1 comment sheldon "Sheldon Cooper"
user_param 1 user_in_group sheldon apartment
user_param 1 user_in_group sheldon physics
user_param 1 user_in_group sheldon caltech
blank_line
entity_exists 1 leonard passwd
user_param 1 comment leonard "Leonard Hofstadter"
user_param 1 user_in_group leonard apartment
user_param 1 user_in_group leonard physics
user_param 1 user_in_group leonard caltech
blank_line
entity_exists 1 penny passwd
user_param 1 comment penny "Penny"
user_param 1 user_in_group penny apartment
user_param 1 account_expiry penny 2025-01-01
blank_line
entity_exists 1 howard passwd
user_param 1 comment howard "Howard Wolowitz"
user_param 1 user_in_group howard caltech
user_param 1 account_expiry howard 2025-01-01
blank_line
entity_exists 1 raj passwd
user_param 1 comment raj "Rajesh Koothrappali"
user_param 1 user_in_group raj caltech
user_param 1 account_expiry raj 2025-01-01
blank_line

check_existence 2 ~/BigBang d
check_existence 2 ~/BigBang/Apartment d
check_existence 2 ~/BigBang/University d
check_existence 2 ~/BigBang/University/PhysicsLab d
check_existence 2 ~/BigBang/ComicBookStore d
check_existence 2 ~/BigBang/ComicBookStore/StuartsApartment d
check_existence 2 /media/BigBang-sdb1 d
check_existence 2 /media/BigBang-sdb2 d
check_existence 2 /media/BigBang-lv_final d
blank_line

check_existence 2 ~/BigBang/ComicBookStore/CaptainSweatpants f
check_existence 2 ~/BigBang/University/BarryKripke f
blank_line

check_existence 3 /dev/sdb1 b
check_part 3 is_mounted /dev/sdb1
check_part 3 mount_point /media/BigBang-sdb1 /dev/sdb1
check_part 3 fs_type /dev/sdb1 vfat
blank_line

check_existence 3 /dev/sdb2 b
check_part 3 is_mounted /dev/sdb2
check_part 3 mount_point /media/BigBang-sdb2 /dev/sdb2
check_part 3 fs_type /dev/sdb2 ext4
blank_line

check_existence 3 /dev/vg_final/lv_final b
check_part 3 is_mounted /dev/mapper/vg_final-lv_final
check_part 3 mount_mount /media/BigBang-lv_final
check_part 3 fs_type /dev/mapper/vg_final-lv_final ext4
blank_line

lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/sdb1 /dev/sdb2 /dev/vg_final/lv_final | tee -a $outfile
blank_line

check_owner 5 ~/BigBang linuxuser
check_group 5 ~/BigBang linuxuser
check_permissions 5 ~/BigBang drwxrwxrwx
check_owner 5 ~/BigBang/University/PhysicsLab sheldon
check_group 5 ~/BigBang/University/PhysicsLab physics
check_permissions 5 ~/BigBang/University/PhysicsLab drwxrwx---
check_owner 5 ~/BigBang/University linuxuser
check_group 5 ~/BigBang/University caltech
check_permissions 5 ~/BigBang/University drwxrwxr-x
check_owner 5 ~/BigBang/ComicBookStore linuxuser
check_group 5 ~/BigBang/ComicBookStore apartment
check_permissions 5 ~/BigBang/ComicBookStore dr-xr-x---
check_owner 5 ~/BigBang/University/BarryKripke linuxuser
check_group 5 ~/BigBang/University/BarryKripke caltech
check_permissions 5 ~/BigBang/University/BarryKripke -r--r-----
blank_line

echo -e "Find Command Files:" | tee -a $outfile
ls -l ~/BigBang/Bang* | tee -a $outfile
blank_line
echo -e "Find Command contents of ~/BigBang/BLaong.txt" | tee -a $outfile
check_existence 6 ~/BigBang/BLaong.txt f
check_line_count 6 ~/BigBang/BLaong.txt 3
tail -5 ~/BigBang/BLaong.txt | tee -a $outfile
blank_line

echo -e "Grep:" | tee -a $outfile
check_existence 7 ~/BigBang/big-bang.txt f
check_line_count 7 ~/BigBang/big-bang.txt 33
tail -5 ~/BigBang/big-bang.txt | tee -a $outfile
blank_line

check_existence 8 ~/BigBang.tar.gz f
file ~/BigBang.tar.gz 2>/dev/null | tee -a $outfile
tar -tzvf ~/BigBang.tar.gz 2> /dev/null | tail -5 | tee -a $outfile
blank_line

echo -e "cron jobs:" | tee -a $outfile
crontab -l | tail -5 |  tee -a $outfile
blank_line

package_check 10 moon-buggy
dpkg --list moon-buggy | tee -a $outfile
blank_line
package_check 10 nmap
blank_line
mail_out_test 01 Final Exam

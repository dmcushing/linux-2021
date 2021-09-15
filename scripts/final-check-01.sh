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
user_param 1 pass_exists sheldon
blank_line
entity_exists 1 leonard passwd
user_param 1 comment leonard "Leonard Hofstadter"
user_param 1 user_in_group leonard apartment
user_param 1 user_in_group leonard physics
user_param 1 user_in_group leonard caltech
user_param 1 pass_exists leonard
blank_line
entity_exists 1 penny passwd
user_param 1 comment penny "Penny"
user_param 1 user_in_group penny apartment
user_param 1 account_expiry penny 2025-01-01
user_param 1 pass_exists penny
blank_line
entity_exists 1 howard passwd
user_param 1 comment howard "Howard Wolowitz"
user_param 1 user_in_group howard caltech
user_param 1 account_expiry howard 2025-01-01
user_param 1 pass_exists howard
blank_line
entity_exists 1 raj passwd
user_param 1 comment raj "Rajesh Koothrappali"
user_param 1 user_in_group raj caltech
user_param 1 account_expiry raj 2025-01-01
user_param 1 pass_exists raj
blank_line

check_existence 2 /home/BigBang d
check_existence 2 /home/BigBang/Apartment d
check_existence 2 /home/BigBang/University d
check_existence 2 /home/BigBang/University/PhysicsLab d
check_existence 2 /home/BigBang/University/BarryKripke f
check_existence 2 /home/BigBang/ComicBookStore d
check_existence 2 /home/BigBang/ComicBookStore/CaptainSweatpants f
check_existence 2 /home/BigBang/ComicBookStore/StuartsApartment d
blank_line

check_existence 3 /dev/sdb1 b
check_part 3 is_mounted /dev/sdb1
check_part 3 mount_point /home/BigBang/Apartment /dev/sdb1
check_part 3 fs_type /dev/sdb1 vfat
blank_line

check_existence 3 /dev/sdb2 b
check_part 3 is_mounted /dev/sdb2
check_part 3 mount_point /home/BigBang/ComicBookStore/StuartsApartment /dev/sdb2
check_part 3 fs_type /dev/sdb2 ext4
blank_line

check_existence 3 /dev/vg_final/lv_final b
check_part 3 is_mounted /dev/mapper/vg_final-lv_final
check_part 3 mount_mount /home/BigBang/University/PhysicsLab
check_part 3 fs_type /dev/mapper/vg_final-lv_final ext4

check_part 4 in_fstab /dev/sdb1
check_part 4 in_fstab /dev/sdb2
check_part 4 in_fstab /dev/vg_final/lv_final
blank_line

check_owner 5 /home/BigBang root
check_group 5 /home/BigBang root
check_permissions 5 /home/BigBang drwxrwxrwx
check_owner 5 /home/BigBang/University/PhysicsLab sheldon
check_group 5 /home/BigBang/University/PhysicsLab physics
check_permissions 5 /home/BigBang/University/PhysicsLab drwxrwx---
check_owner 5 /home/BigBang/University root
check_group 5 /home/BigBang/University caltech
check_permissions 5 /home/BigBang/University drwxrwxr-x
check_owner 5 /home/BigBang/ComicBookStore root
check_group 5 /home/BigBang/ComicBookStore apartment
check_permissions 5 /home/BigBang/ComicBookStore dr-xr-x---
check_owner 5 /home/BigBang/University/BarryKripke root
check_group 5 /home/BigBang/University/BarryKripke caltech
check_permissions 5 /home/BigBang/University/BarryKripke -r--r-----
blank_line

echo -e "Find Command Files:" | tee -a $outfile
check_existence 6 /home/BigBang/Bangkok f
check_existence 6 /home/BigBang/Bangui f
ls -l /home/BigBang/Bang* | tee -a $outfile
blank_line
echo -e "Find Command contents of /home/BigBang/bang.txt" | tee -a $outfile
check_existence 6 /home/BigBang/bang.txt f
tail -5 /home/BigBang/bang.txt | tee -a $outfile
blank_line
echo -e "Grep:" | tee -a $outfile
check_existence 7 /home/BigBang/host.txt f
tail -5 /home/BigBang/host.txt | tee -a $outfile

check_existence 8 /tmp/BigBang.tar.gz f
tar -tzvf /tmp/BigBang.tar.gz | tail -5 | tee -a $outfile
blank_line

echo -e "cron jobs:" | tee -a $outfile
crontab -l | tee -a $outfile
blank_line

echo -e "/proc - is net.ipv4.ip_default_ttl = 32?" | tee -a $outfile
sysctl net.ipv4.ip_default_ttl | tee -a $outfile
blank_line
echo -e "Is there an entry in the correct file?" | tee -a $outfile
grep 'net.ipv4.ip_default_ttl' /etc/sysctl.conf | tee -a $outfile
blank_line
package_check 10 moon-buggy
dpkg --list moon-buggy | tee -a $outfile
package_check 10 nmap
blank_line
mail_out_test Final Exam

#!/bin/bash
# Final Exam

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Final Exam

# Question 1

entity_exists 1 university group
entity_exists 1 apartment group
entity_exists 1 physics group
blank_line
entity_exists 1 sheldon passwd
user_param 1 comment sheldon "Sheldon Cooper"
user_param 1 user_in_group sheldon apartment
user_param 1 user_in_group sheldon physics
user_param 1 user_in_group sheldon university
user_param 1 pass_exists sheldon
blank_line
entity_exists 1 leonard passwd
user_param 1 comment leonard "Leonard Hofstadter"
user_param 1 user_in_group leonard apartment
user_param 1 user_in_group leonard physics
user_param 1 user_in_group leonard university
user_param 1 pass_exists leonard
blank_line
entity_exists 1 penny passwd
user_param 1 comment penny "Penny"
user_param 1 user_in_group penny apartment
user_param 1 account_expiry penny 2025-03-01
user_param 1 pass_exists penny
blank_line
entity_exists 1 bernadette passwd
user_param 1 comment bernadette "Bernadette"
user_param 1 user_in_group bernadette university
user_param 1 account_expiry bernadette 2025-03-02
user_param 1 pass_exists bernadette
blank_line
entity_exists 1 amy passwd
user_param 1 comment amy "Amy Farrah Fowler"
user_param 1 user_in_group amy university
user_param 1 account_expiry amy 2025-03-03
user_param 1 pass_exists amy
blank_line

check_existence 2 /home/BigBang d
check_existence 2 /home/BigBang/Apartment d
check_existence 2 /home/BigBang/University d
check_existence 2 /home/BigBang/University/Kripke f
check_existence 2 /home/BigBang/ComicBookStore d
check_existence 2 /home/BigBang/ComicBookStore/WilWheaton f
check_existence 2 /home/BigBang/ComicBookStore/TheCounter d
blank_line

check_existence 3 /dev/sdd1 b
check_part 3 part_size /dev/sdd1 1044193
check_part 3 is_mounted /dev/sdd1
check_part 3 mount_point /home/BigBang/Apartment /dev/sdd1
check_part 3 fs_type /dev/sdd1 ext3
blank_line

check_existence 3 /dev/sde1 b
check_part 3 part_size /dev/sde1 1044193
check_part 3 is_mounted /dev/sde1
check_part 3 mount_point /home/BigBang/ComicBookStore/TheCounter /dev/sde1
check_part 3 fs_type /dev/sde1 fuseblk
blank_line

check_part 4 in_fstab /dev/sdd1
check_part 4 in_fstab /dev/sde1
blank_line

check_owner 5 /home/BigBang root
check_group 5 /home/BigBang root
check_permissions 5 /home/BigBang drwxrwxrwx
check_owner 5 /home/BigBang/Apartment sheldon
check_group 5 /home/BigBang/Apartment apartment
check_permissions 5 /home/BigBang/Apartment drwxrwx---
check_owner 5 /home/BigBang/University root
check_group 5 /home/BigBang/University university
check_permissions 5 /home/BigBang/University drwxrwxr-x
check_owner 5 /home/BigBang/ComicBookStore root
check_group 5 /home/BigBang/ComicBookStore university
check_permissions 5 /home/BigBang/ComicBookStore dr-xr-x---
check_owner 5 /home/BigBang/University/Kripke root
check_group 5 /home/BigBang/University/Kripke university
check_permissions 5 /home/BigBang/University/Kripke -rw-r-----
blank_line

echo -e "Find Command Files:" | tee -a $outfile
ls -l /home/BigBang/BIG* | tee -a $outfile
blank_line
echo -e "Find Command contents of /home/BigBang/bang.txt" | tee -a $outfile
cat /home/BigBang/big.txt | tee -a $outfile
blank_line

echo -e "Contents of /home/BigBang/kernel.txt" | tee -a $outfile
cat /home/BigBang/kernel.txt | nl | tee -a $outfile
blank_line

check_existence 8 /tmp/BigBang.tar.gz f
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
package_check 10 rpl
blank_line
package_check 11 xinetd
package_check 11 rsh
package_check 11 rsh-server
blank_line
echo -e "Does xinetd start *only* on 3 and 5?" | tee -a $outfile
chkconfig --list xinetd | tee -a $outfile
blank_line
echo -e "Is rsh on?" | tee -a $outfile
chkconfig --list | grep 'rsh' | tee -a $outfile
blank_line
mail_out Final Exam

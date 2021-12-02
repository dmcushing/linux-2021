#!/bin/bash
# Final Exam

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info_midterm Final Exam

# Question 1

entity_exists 1 falcon group
entity_exists 1 speeder group
entity_exists 1 rebel group
entity_exists 1 desert group
entity_exists 1 deathstar group
blank_line
entity_exists 1 luke passwd
user_param 1 comment luke "Mark Hammill"
user_param 1 user_in_group luke falcon
user_param 1 user_in_group luke speeder
user_param 1 user_in_group luke rebel
blank_line
entity_exists 1 han passwd
user_param 1 comment han "Harrison Ford"
user_param 1 user_in_group han matrix
user_param 1 user_in_group han redpill
user_param 1 user_in_group han ship
blank_line
entity_exists 1 leia passwd
user_param 1 comment leia "Carrie Fisher"
user_param 1 user_in_group leia falcon
user_param 1 account_expiry leia 2135-03-01
blank_line
entity_exists 1 obiwan passwd
user_param 1 comment obiwan "Alec Guinness"
user_param 1 user_in_group obiwan desert
user_param 1 account_expiry obiwan 2135-03-01
blank_line
entity_exists 1 vader passwd
user_param 1 comment vader "David Prowse"
user_param 1 user_in_group vader deathstar
user_param 1 account_expiry vader 2135-03-01
blank_line

check_existence 2 ~/StarWars d
check_existence 2 ~/StarWars/Tatooine d
check_existence 2 ~/StarWars/Falcon d
check_existence 2 ~/StarWars/Falcon/Smuggler d
check_existence 2 ~/StarWars/Destroyer d
check_existence 2 ~/StarWars/Destroyer/DetentionLevel d
check_existence 2 /media/StarWars-sdb1 d
check_existence 2 /media/StarWars-sdb2 d
check_existence 2 /media/StarWars-lv_deathstar d
blank_line

check_existence 2 ~/StarWars/Falcon/Blaster f
check_existence 2 ~/StarWars/Destroyer/MoffTarkin f
blank_line

check_existence 3 /dev/sdb1 b
check_part 3 is_mounted /dev/sdb1
check_part 3 mount_point /media/StarWars-sdb1 /dev/sdb1
check_part 3 fs_type /dev/sdb1 vfat
blank_line

check_existence 3 /dev/sdb2 b
check_part 3 is_mounted /dev/sdb2
check_part 3 mount_point /media/StarWars-sdb2 /dev/sdb2
check_part 3 fs_type /dev/sdb2 ext4
mount | grep 'sdb2' | tee -a $outfile
blank_line

check_existence 3 /dev/vg_StarWars/lv_deathstar b
check_part 3 is_mounted /dev/mapper/vg_StarWars-lv_deathstar
check_part 3 mount_mount /media/StarWars-lv_deathstar
check_part 3 fs_type /dev/mapper/vg_StarWars-lv_deathstar ext4
blank_line

lsblk -l -o NAME,SIZE,FSTYPE,MOUNTPOINT /dev/sdb1 /dev/sdb2 /dev/vg_StarWars/lv_StarWars | tee -a $outfile
blank_line

check_owner 5 ~/StarWars linuxuser
check_group 5 ~/StarWars linuxuser
check_permissions 5 ~/StarWars drwxrwxrwx
check_owner 5 ~/StarWars/Falcon han
check_group 5 ~/StarWars/Falcon rebel
check_permissions 5 ~/StarWars/Falcon drwxrwx---
check_owner 5 ~/StarWars/Destroyer linuxuser
check_group 5 ~/StarWars/Destroyer deathstar
check_permissions 5 ~/StarWars/Destroyer drwxrwxr-x
check_owner 5 ~/StarWars/Falcon/Smuggler han
check_group 5 ~/StarWars/Falcon/Smuggler falcon
check_permissions 5 ~/StarWars/Falcon/Smuggler dr-xr-x---
check_owner 5 ~/StarWars/Destroyer/MoffTarkin vader
check_group 5 ~/StarWars/Destroyer/MoffTarkin deathstar
check_permissions 5 ~/StarWars/Destroyer/MoffTarkin -r--r-----
blank_line

echo -e "Find Command Files:" | tee -a $outfile
ls -l ~/StarWars/warp* | tee -a $outfile
blank_line
echo -e "Find Command contents of ~/StarWars/SAtlr.txt" | tee -a $outfile
check_existence 6 ~/StarWars/SAtlr.txt f
check_line_count 6 ~/StarWars/SAtlr.txt 2
tail -5 ~/StarWars/SAtlr.txt | tee -a $outfile
blank_line

echo -e "Grep:" | tee -a $outfile
check_existence 7 ~/StarWars/starwars.txt f
check_line_count 7 ~/StarWars/starwars.txt 132
tail -5 ~/StarWars/starwars.txt | tee -a $outfile
blank_line

check_existence 8 ~/starwars.tar.gz f
file ~/starwars.tar.gz 2>/dev/null | tee -a $outfile
tar -tzvf ~/starwars.tar.gz 2> /dev/null | tail -5 | tee -a $outfile
blank_line

echo -e "cron jobs:" | tee -a $outfile
crontab -l | tail -5 |  tee -a $outfile
blank_line

package_check 10 moon-buggy
dpkg --list moon-buggy | tee -a $outfile
blank_line
package_check 10 nmap
blank_line
mail_out_test 04 Final Exam

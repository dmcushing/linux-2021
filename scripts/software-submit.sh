#!/bin/bash
# Software Packages

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Software Packages

# Question 1.1
package_check 1.1 joe
package_check 1.1 nudoku
package_check 1.1 pacman4console
blank_line

# Question 1.2
check_existence 1.2 ~/software/dpkg-joefiles.txt f
tail -5 ~/software/dpkg-joefiles.txt | tee -a $outfile
blank_line

# Question 1.3
check_existence 1.3 ~/software/apt-joestatus.txt f
tail -5  ~/software/apt-joestatus.txt | tee -a $outfile
blank_line

# Question 1.4
check_existence 1.4 ~/software/apt-joemaintainer.txt f
tail  -5 ~/software/apt-joemaintainer.txt | tee -a $outfile
blank_line

# Question 1.5
check_existence 1.5 ~/software/dpkg-joeremoved.txt f
tail -5 ~/software/dpkg-joeremoved.txt | tee -a $outfile
dpkg --list joe | tee -a $outfile
blank_line

# Question 2.1
check_existence 2.1 ~/software/alpineinstall.txt f
tail -5 ~/software/alpineinstall.txt | tee -a $outfile
blank_line

# Question 2.2
check_existence 2.2 ~/software/alpinefiles.txt f
tail -5 ~/software/alpinefiles.txt | tee -a $outfile
blank_line

# Question 2.3
check_existence 2.3 ~/software/alpinestatus.txt f
tail -5  ~/software/alpinestatus.txt | tee -a $outfile
blank_line

# Question 2.4
check_existence 2.4 ~/software/alpineditor.txt f
tail  -5 ~/software/alpineditor.txt | tee -a $outfile
blank_line

# Question 2.5
check_existence 2.5 ~/software/alpineremoved.txt f
dpkg --list alpine-pico | tee -a $outfile
blank_line

# Question 3.1
check_existence 3.1 /usr/local/bin/hello f
blank_line

# Question 4.1
check_existence 4.1 ~/software/findage.txt f
tail -5 ~/software/findage.txt | tee -a $outfile
blank_line

# Question 4.2
check_existence 4.2 ~/software/good.txt f
tail -5  ~/software/good.txt | tee -a $outfile
blank_line

# Question 4.3
check_existence 4.3 ~/software/Hfiles.txt f
tail -5 ~/software/Hfiles.txt | tee -a $outfile
blank_line

# Question 4.4
check_existence 4.4 ~/software/grep-alpine-joe.txt f
tail -5 ~/software/grep-alpine-joe.txt | tee -a $outfile
blank_line

# Question 4.5
check_existence 4.5 ~/software/dpkg-apt.tar.bz2 f
tar tjvf ~/software/dpkg-apt.tar.bz2 | tee -a $outfile
file ~/software/dpkg-apt.tar.bz2 | tee -a $outfile
blank_line

# Toughie!
check_existence Toughie ~/software/allx.tar.gz f
tar tzvf ~/software/allx.tar.gz | tee -a $outfile

mail_out Software Packages

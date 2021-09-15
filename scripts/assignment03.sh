#!/bin/bash
# Assignment 03 Software Installs

source /scripts/functions.sh

# Gather Student Work

clear
is_super_user
student_info Assignment 03

# Question 1.1
package_check 1.1 joe
package_check 1.1 moon-buggy
package_check 1.1 ninvaders
blank_line

# Question 1.2
check_existence 1.2 ~/joefiles.txt f
tail -3 ~/joefiles.txt | tee -a $outfile
blank_line

# Question 1.3
check_existence 1.3 ~/joestatus.txt f
head -3  ~/joestatus.txt | tee -a $outfile
blank_line

# Question 1.4
check_existence 1.4 ~/joemaintainer.txt f
tail  ~/joemaintainer.txt | tee -a $outfile
blank_line

# Question 1.5
check_existence 1.5 ~/joeremoved.txt f
dpkg --list joe | tee -a $outfile
blank_line

# Question 2.1
check_existence 2.1 ~/alpineinstall.txt f
tail -3 ~/alpineinstall.txt | tee -a $outfile
blank_line

# Question 2.2
check_existence 2.2 ~/alpinefiles.txt f
tail -3 ~/alpinefiles.txt | tee -a $outfile
blank_line

# Question 2.3
check_existence 2.3 ~/alpinestatus.txt f
head -3  ~/alpinestatus.txt | tee -a $outfile
blank_line

# Question 2.4
check_existence 2.4 ~/alpineditor.txt f
tail  ~/alpineditor.txt | tee -a $outfile
blank_line

# Question 2.5
check_existence 2.5 ~/alpineremoved.txt f
dpkg --list alpine-pico | tee -a $outfile
blank_line

# Question 3.1
check_existence 3.1 /usr/local/bin/hello f
blank_line

# Question 4.1
check_existence 4.1 ~/findage.txt f
tail -3 ~/findage.txt | tee -a $outfile
blank_line

# Question 4.2
check_existence 4.2 ~/good.txt f
tail -3  ~/good.txt | tee -a $outfile
blank_line

# Question 4.3
check_existence 4.3 ~/Hfiles.txt f
tail -3 ~/Hfiles.txt | tee -a $outfile
blank_line

# Question 4.4
check_existence 4.4 ~/aljoegrep.txt f
tail -3 ~/aljoegrep.txt | tee -a $outfile
blank_line

# Question 4.5
check_existence 4.5 ~/alpinejoe.tar.bz2 f
tar tjvf ~/alpinejoe.tar.bz2 | tee -a $outfile
blank_line

# Toughie!
check_existence Toughie ~/allx.tar.gz f
tar tzvf ~/allx.tar.gz | tee -a $outfile

mail_out Assignment 03

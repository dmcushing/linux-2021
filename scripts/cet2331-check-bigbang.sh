#!/bin/bash
# Final Exam

clear
echo -e "CET2331 Final - knock,knock,knock Penny?"
sleep 2
echo -e "                  knock,knock,knock Penny?"
sleep 2
echo -e "                    knock,knock,knock Penny?"

if [ $EUID -ne 0 ]
then
        echo "Insufficient permissions. Run this script as root, or with sudo."
        exit 1
fi

echo -n "Enter your first name: "
read fname
echo -n "Enter your last name: "
read lname
echo -n "Enter your Student number: "
read snumber
filename=$snumber-final_${fname:0:1}_$lname.txt
tarfile=$snumber-final_${fname:0:1}_$lname.tar.gz
outfile=/tmp/$filename

echo -e "Work will be saved in $outfile \n"
echo -e "CET2331 Final - Big Bang Theory ($snumber) $fname $lname \n" > $outfile
cat /etc/sysconfig/network >> $outfile

# Check to see if groups were created

GRPID=("apartment" "university" "physics")
for GRPID in ${GRPID[*]}
do
/bin/egrep -i ^${GRPID} /etc/group > /dev/null
if [ $? -eq 0 ]; then
   echo -e "Group $GRPID exists - good." | tee -a $outfile
   echo -e "Group Membership: `/bin/egrep -i ^${GRPID} /etc/group`" | tee -a $outfile
else
   echo -e "Group $GROUPID does not exist - try again." | tee -a $outfile
fi
done

echo -e " " | tee -a $outfile

# Check to see if the users were set up correctly

USERID=("sheldon" "leonard" "penny" "howard" "raj" )
NAME=("Sheldon Cooper" "Leonard Hofstadter" "Penny" "Howard Wolowitz" "Rajesh Koothrappali")
EXP=(" never" " never" " Jan 01, 2025" " Jan 01, 2025" " Jan 01, 2025")
for ((loop=0;loop<${#USERID[@]};++loop));
do
	getent passwd ${USERID[loop]} > /dev/null
	if [ $? -eq 0 ]; then
    		echo -e "${USERID[loop]}: user exists" | tee -a $outfile
	else
		echo -e "${USERID[loop]}: user DOES NOT exist - please create" | tee -a $outfile
	fi
	if [ "`grep ${USERID[loop]} /etc/shadow | cut -d: -f2`" == "!!" ]; then
		echo -e "${USERID[loop]}: has NO PASSWORD - please set" | tee -a $outfile
	else
	    echo -e "${USERID[loop]}: has a password." | tee -a $outfile
	fi
	if [ "`grep ${USERID[loop]} /etc/passwd | cut -d: -f5`" == "${NAME[loop]}" ]; then
        	echo -e "${USERID[loop]}: Correct full name ${NAME[loop]}" | tee -a $outfile
	else
        	echo -e "${USERID[loop]}: INCORRECT comment field - should be ${NAME[loop]}" | tee -a $outfile
	fi
	if [ "`chage -l ${USERID[loop]} | grep 'nt expires' | cut -d: -f2`" == "${EXP[loop]}" ]; then
        	echo -e "${USERID[loop]}: Correct expiry date ${EXP[loop]}" | tee -a $outfile
	else
        	echo -e "${USERID[loop]}: INCORRECT expiry date - should be ${EXP[loop]}" | tee -a $outfile
	fi
 
echo " " | tee -a $outfile
done

DIRECTORY=( "/home/BigBang" "/home/BigBang/University" "/home/BigBang/Apartment" "/home/BigBang/ComicBookStore" "/home/BigBang/ComicBookStore/StuartsApartment" )
PERMISSIONS=( "drwxrwxrwx" "drwxrwxr--" "drwxrwxr--" "dr-xr-x---" "drwxr-xr-x" )
OWNERS=( "root" "root" "sheldon" "root" "root"  )
GRPS=( "root" "university" "apartment" "university" "root" )
for ((loop=0;loop<${#DIRECTORY[@]};++loop));
do
	if [ -d "${DIRECTORY[loop]}" ]; then
        	echo -e  "Directory ${DIRECTORY[loop]} exists - good" | tee -a $outfile
	else
                echo -e "Directory ${DIRECTORY[loop]} doesn\'t exist - please check" | tee -a $outfile
	fi
	if [[ "`stat -c %A ${DIRECTORY[loop]}`" == "${PERMISSIONS[loop]}" ]]; then
		echo -e "${DIRECTORY[loop]} - correct permissions" | tee -a $outfile
	else
		echo -e "${DIRECTORY[loop]} - incorrect permissions - should be ${PERMISSIONS[loop]}" | tee -a $outfile
	fi
	if [[ "`stat -c %U ${DIRECTORY[loop]}`" == "${OWNERS[loop]}" ]]; then
	    echo -e "${DIRECTORY[loop]} - correct owner" | tee -a $outfile
	else
	    echo -e "${DIRECTORY[loop]} - INCORRECT owner - should be ${OWNERS[loop]}" | tee -a $outfile
	fi 
	if [[ "`stat -c %G ${DIRECTORY[loop]}`" == "${GRPS[loop]}" ]]; then
	    echo -e "${DIRECTORY[loop]} - correct group" | tee -a $outfile
	else
	    echo -e "${DIRECTORY[loop]} - INCORRECT owner - should be ${GRPS[loop]}" | tee -a $outfile
	fi 
	echo -e " " | tee -a $outfile
done

echo -e " " | tee -a $outfile

if [ -f /home/BigBang/University/LeslieWinkle ]; then
    echo -e "/home/BigBang/University/LeslieWinkle - exists" | tee -a $outfile
else
    echo -e "/home/BigBang/University/LeslieWinkle - DOES NOT owner" | tee -a $outfile
fi
if [[ "`stat -c %U /home/BigBang/University/LeslieWinkle`" == "root" ]]; then
    echo -e "/home/BigBang/University/LeslieWinkle - correct owner" | tee -a $outfile
else
    echo -e "/home/BigBang/University/LeslieWinkle - INCORRECT owner - should be root" | tee -a $outfile
fi 
if [[ "`stat -c %G /home/BigBang/University/LeslieWinkle`" == "university" ]]; then
    echo -e "/home/BigBang/University/LeslieWinkle - correct group" | tee -a $outfile
else
    echo -e "/home/BigBang/University/LeslieWinkle - INCORRECT group - should be university" | tee -a $outfile
fi 
if [[ "`stat -c %A /home/BigBang/University/LeslieWinkle`" == "-r--r-----" ]]; then
    echo -e "/home/BigBang/University/LeslieWinkle - correct permissions" | tee -a $outfile
else
    echo -e "/home/BigBang/University/LeslieWinkle - INCORRECT permissions - should be -r--r-----" | tee -a $outfile
fi 

echo -e " " | tee -a $outfile
echo -e " Check /dev/sdb======" | tee -a $outfile
echo -e "    Partitioned: `fdisk -l /dev/sdb | grep sdb1`" | tee -a $outfile
echo -e "Mounted as ext4: `mount | grep sdb1`" | tee -a $outfile
echo -e "  In /etc/fstab: `grep sdb1 /etc/fstab`" | tee -a $outfile
echo -e " " | tee -a $outfile
echo -e " Check /dev/sdc======" | tee -a $outfile
echo -e "    Partitioned: `fdisk -l /dev/sdc | grep sdc1`" | tee -a $outfile
echo -e "Mounted as ext4: `mount | grep sdc1`" | tee -a $outfile
echo -e "  In /etc/fstab: `grep sdc1 /etc/fstab`" | tee -a $outfile

echo " " | tee -a $outfile

FILES=( "/home/BigBang/Bangkok" "/home/BigBang/Bangui" "/home/BigBang/bang.txt" "/home/BigBang/the.txt" "/tmp/BigBang.tar.gz" )
for FILES in ${FILES[*]};
do
	if [ -e $FILES ]; then
		echo -e "file: $FILES - exists with `wc -l $FILES | cut -d" " -f1` lines" | tee -a $outfile
	else
		echo -e "file: $FILES - DOES NOT exist - try again" | tee -a $outfile
	fi
done
echo " " | tee -a $outfile
echo "CRONTAB " | tee -a $outfile
crontab -l | tee -a $outfile
echo " " | tee -a $outfile
echo "NETWORKING " | tee -a $outfile
ip a | grep 192.168.10 | tee -a $outfile
echo " " | tee -a $outfile
echo "/proc" | tee -a $outfile
sysctl net.ipv4.ip_default_ttl | tee -a $outfile
grep ip_default_ttl /etc/sysctl.conf | tee -a $outfile

read -p "Mail your work? (y/n) "
[ "$REPLY" != "y" ] || cat $outfile | mailx -v -s "Big Bang Final $fname $lname" dmc1208@gmail.com

#!/bin/bash
#  Bond, James Bond

clear
source /scripts/functions.sh
is_super_user
student_info Bond Lab
DIRECTORY=("/home/bond/roger" "/home/bond/pre80s/sean" "/home/bond/pre80s/george" "/home/bond/post80s/timothy" "/home/bond/post80s/pierce" "/home/bond/post80s/daniel")
for DIRECTORY in ${DIRECTORY[*]}
do
    if [ -d "$DIRECTORY" ]; then
                echo -e  "Directory $DIRECTORY exists - good" | tee -a $outfile
    else
                echo -e "Directory $DIRECTORY doesn't exist - please check" | tee -a $outfile
fi
if [[ "`stat -c %A $DIRECTORY`" == "drwxr-xr-x" ]]; then
 	echo -e "$DIRECTORY - correct permissions" | tee -a $outfile
else
        echo -e "$DIRECTORY - incorrect permissions, try again." | tee -a $outfile
fi
echo -e " " | tee -a $outfile
done

echo -e " " | tee -a $outfile

GROUPID=("pre80s" "post80s" "bonds")
for GROUPID in ${GROUPID[*]}
do
/bin/egrep -i ^${GROUPID} /etc/group > /dev/null
if [ $? -eq 0 ]; then
   echo -e "Group $GROUPID exists - good." | tee -a $outfile
   echo -e "Group Membership: `/bin/egrep -i ^${GROUPID} /etc/group`" | tee -a $outfile
else
   echo -e "Group $GROUPID does not exist - try again." | tee -a $outfile
fi
done


echo -e " " | tee -a $outfile

USERID=("sean" "george" "roger" "timothy" "pierce" "daniel")
for USERID in ${USERID[*]}
do
getent passwd ${USERID} > /dev/null
if [ $? -eq 0 ]; then
    echo -e "$USERID: user exists" | tee -a $outfile
else
    echo -e "$USERID: user DOES NOT exist - please create" | tee -a $outfile
fi
if [ "`grep $USERID /etc/shadow | cut -d: -f2`" == "!!" ]; then
    echo -e "$USERID: has NO PASSWORD - please set" | tee -a $outfile
else
    echo -e "$USERID: has a password." | tee -a $outfile
fi
echo " " | tee -a $outfile
done

if [ "`grep sean /etc/passwd | cut -d: -f5`" == "Sean Connery" ]; then
        echo -e "sean: Correct full name Sean Connery" | tee -a $outfile
else
        echo -e "sean: INCORRECT comment field - should be Sean Connery" | tee -a $outfile
fi
if [ "`grep george /etc/passwd | cut -d: -f5`" == "George Lazenby" ]; then
        echo -e "george: Correct full name George Lazenby" | tee -a $outfile
else
        echo -e "george: INCORRECT comment field - should be George Lazenby" | tee -a $outfile
fi
if [ "`grep "roger" /etc/passwd | cut -d: -f5`" == "Roger Moore" ]; then
        echo -e "roger: Correct full name Roger Moore" | tee -a $outfile
else
        echo -e "roger: Correct full name Roger Moore" | tee -a $outfile
fi
if [ "`grep timothy /etc/passwd | cut -d: -f5`" == "Timothy Dalton" ]; then
        echo -e "timothy: Correct full name Timothy Dalton" | tee -a $outfile
else
        echo -e "timothy: INCORRECT comment field - should be Timothy Dalton" | tee -a $outfile
fi
if [ "`grep pierce /etc/passwd | cut -d: -f5`" == "Pierce Brosnan" ]; then
        echo -e "pierce: Correct full name Pierce Brosnan" | tee -a $outfile
else
        echo -e "pierce: INCORRECT comment field - should be Pierce Brosnan" | tee -a $outfile
fi
if [ "`grep daniel /etc/passwd | cut -d: -f5`" == "Daniel Craig" ]; then
        echo -e "daniel: Correct full name Daniel Craig" | tee -a $outfile
else
        echo -e "daniel: INCORRECT comment field - should be Daniel Craig" | tee -a $outfile
fi

echo " " | tee -a $outfile

GROUPID=("pre80s" "post80s")
for GROUPID in ${GROUPID[*]}
do
    USERID=("sean" "george" "roger" "timothy" "pierce" "daniel") 
    for USERID in ${USERID[*]}
    do
    if [[ "$GROUPID" == "pre80s" && ($USERID == "timothy" || $USERID == "pierce" || $USERID == "daniel") ]]; then
            continue
    fi
    if [[ "$GROUPID" == "post80s" && ($USERID == "sean" || $USERID == "george") ]]; then
        continue
    fi
    if [[ "$GROUPID" == "pre80s" && "$USERID" == "sean" ]]; then
        FILES=("/home/bond/pre80s/sean/drno-1962" "/home/bond/pre80s/sean/fromrussiawithlove-1963" "/home/bond/pre80s/sean/goldfinger-1964" "/home/bond/pre80s/sean/thunderball-1965" "/home/bond/pre80s/sean/youonlylivetwice-1967" "/home/bond/pre80s/sean/diamondsareforever-1971")
    fi
    if [[ "$GROUPID" == "pre80s" && "$USERID" == "george" ]]; then
    FILES=("/home/bond/pre80s/george/onhermajestyssecretservice-1969")
    fi
    if [[ "$GROUPID" == "pre80s" && "$USERID" == "roger" ]]; then
    FILES=("/home/bond/roger/liveandletdie-1973" "/home/bond/roger/manwiththegoldengun-1974" "/home/bond/roger/spywholovedme-1977" "/home/bond/roger/moonraker-1979")
    fi
    if [[ "$GROUPID" == "post80s" && "$USERID" == "roger" ]]; then
    FILES=("/home/bond/roger/foryoureyesonly-1981" "/home/bond/roger/octopussy-1983" "/home/bond/roger/aviewtoakill-1985") 
    fi
    if [[ "$GROUPID" == "post80s" && "$USERID" == "timothy" ]]; then
    FILES=("/home/bond/post80s/timothy/livingdaylights-1987" "/home/bond/post80s/timothy/licencetokill-1989")
    fi
    if [[ "$GROUPID" == "post80s" && "$USERID" == "pierce" ]]; then
    FILES=("/home/bond/post80s/pierce/goldeneye-1995" "/home/bond/post80s/pierce/tomorrowneverdies-1997" "/home/bond/post80s/pierce/worldisnotenough-1999" "/home/bond/post80s/pierce/dieanotherday-2002")
    fi
    if [[ "$GROUPID" == "post80s" && "$USERID" == "daniel" ]]; then
    FILES=("/home/bond/post80s/daniel/casinoroyale-2006" "/home/bond/post80s/daniel/quantumofsolace-2008" "/home/bond/post80s/daniel/skyfall-2012" "/home/bond/post80s/daniel/spectre-2015" "/home/bond/post80s/daniel/notimetodie-2021")
    fi
    echo $GROUPID $USERID | tee -a $outfile
    echo " " | tee -a $outfile

for FILES in ${FILES[*]}
do
 if [ -f $FILES ];
then
   echo -e "file: $FILES exists - good." | tee -a $outfile
else
   echo -e "file: $FILES does not exist - try again." | tee -a $outfile
fi

if [[ "`stat -c %A $FILES`" == "-rw-rw----" ]]; then
    echo -e "file: $FILES - correct permissions" | tee -a $outfile
else
	echo -e "file: $FILES - incorrect permissions `stat -c %A $FILES`, try again." | tee -a $outfile
fi
if [[ "`stat -c %U $FILES`" == "$USERID" ]]; then
	echo -e "file: $FILES - correct owner: $USERID" | tee -a $outfile
else
	echo -e "file: $FILES - incorrect owner `stat -c %U $FILES` - try again." | tee -a $outfile
fi
if [[ "`stat -c %G $FILES`" == "$GROUPID" ]]; then
	echo -e "file: $FILES - correct group: $GROUPID" | tee -a $outfile
else
	echo -e "file: $FILES - incorrect group `stat -c %G $FILES`- try again." | tee -a $outfile
fi
echo -e " " | tee -a $outfile
done
done
done

if [[ "`stat -c %A /home/bond/pre80s/roger`" == "lrwxrwxrwx" ]]; then
    echo -e "symlink: /home/bond/pre80s/roger - exists" | tee -a $outfile
else
    echo -e "symlink: /home/bond/pre80s/roger - DOES NOT exist - try again" | tee -a $outfile
fi 
if [[ "`stat -c %A /home/bond/post80s/roger`" == "lrwxrwxrwx" ]]; then
    echo -e "symlink: /home/bond/post80s/roger - exists" | tee -a $outfile
else
    echo -e "symlink: /home/bond/post80s/roger - DOES NOT exist - try again" | tee -a $outfile
fi 
echo " " | tee -a $outfile
if [ -e /home/bond/scaramanga.txt ]; then
    echo -e "file: /home/bond/scaramanga.txt - exists" | tee -a $outfile
else
    echo -e "file: /home/bond/scaramanga.txt - DOES NOT exist - try again" | tee -a $outfile
fi
if [[ "`cat /home/bond/scaramanga.txt | wc -l`" == "31" ]]; then
    echo -e "file: /home/bond/scaramanga.txt - correct number of lines" | tee -a $outfile
    cat /home/bond/scaramanga.txt >> $outfile
else
    echo -e "file: /home/bond/scaramanga.txt - incorrect number of lines `wc -l < /home/bond/scaramanga.txt` - try again" | tee -a $outfile
fi
echo " " | tee -a $outfile

if [ -e /home/bond/70sflicks.txt ]; then
    echo -e "file: /home/bond/70sflicks.txt - exists" | tee -a $outfile
else
    echo -e "file: /home/bond/70sflicks.txt - DOES NOT exist - try again" | tee -a $outfile
fi
if [[ "`cat /home/bond/70sflicks.txt | wc -l`" == "5" ]]; then
    echo -e "file: /home/bond/70sflicks.txt - correct number of lines" | tee -a $outfile
    cat /home/bond/70sflicks.txt >> $outfile
else
    echo -e "file: /home/bond/70sflicks.txt - incorrect number of lines `wc -l < /home/bond/70sflicks.txt` - try again" | tee -a $outfile
fi
echo " " | tee -a $outfile


if [ -e /home/bond/usedspace.txt ]; then
    echo -e "file: /home/bond/usedspace.txt - exists" | tee -a $outfile
    cat /home/bond/usedspace.txt >> $outfile
else
    echo -e "file: /home/bond/usedspace.txt - DOES NOT exist - try again" | tee -a $outfile
fi

if [ -e /home/linuxuser/bondassignment.tar.gz ]; then
    echo -e "file: /home/linuxuser/bondassignment.tar.gz - exists" | tee -a $outfile
    tar -tzvf /home/linuxuser/bondassignment.tar.gz | head -5 | tee -a $outfile
else
    echo -e "file: /home/linuxuser/bondassignment.tar.gz - DOES NOT exist - try again" | tee -a $outfile
fi

# Submit the work
mail_out Bond Lab

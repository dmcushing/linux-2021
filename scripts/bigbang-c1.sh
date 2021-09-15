#!/bin/bash

outfile=/tmp/testfile

echo -e "Work will be saved in $outfile \n"
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


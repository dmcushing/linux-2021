#!/bin/bash
# Coffee Startup Script

source /scripts/functions.sh

clear
is_super_user
student_info Coffee Lab

echo -e "Is coffee installed and disabled?" | tee -a $outfile

echo -e "Coffee is $(systemctl is-active coffee.service) and $(systemctl show -p SubState sshd | cut -d'=' -f2)" | tee -a $outfile
blank_line

# Submit the work
mail_out Coffee Lab
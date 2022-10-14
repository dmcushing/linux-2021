#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
rm -Rf ~/Quiz05
mkdir -p ~/Quiz5/scranton/office
mkdir -p ~/Quiz5/scranton/lunchroom
cp /scripts/work/StephenKingBooks.txt ~/Quiz05/books.txt
chown -R linuxuser:linuxuser /home/linuxuser/Quiz05
echo -e "Done setting up."
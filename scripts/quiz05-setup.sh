#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
rm -Rf ~/Quiz05
mkdir -p ~/Quiz05/scranton/office
mkdir -p ~/Quiz05/scranton/lunchroom
cp /scripts/data/StephenKingBooks.txt ~/Quiz05/books.txt
chown -R linuxuser:linuxuser /home/linuxuser/Quiz05
echo -e "Done setting up."
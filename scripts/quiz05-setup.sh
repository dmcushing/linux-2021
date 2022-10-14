#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
rm -Rf ~/Quiz05
mkdir ~/Quiz05
cp /scripts/home/StephenKingBooks.txt ~/Quiz05/books.txt
chown -R linuxuser:linuxuser /home/linuxuser/Quiz05
echo -e "Done setting up."
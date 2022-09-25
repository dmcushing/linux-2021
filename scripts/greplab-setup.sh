#!/bin/bash

# Grep Lab Setup Script

source /scripts/functions.sh
clear
is_super_user

echo -e "grep lab set up - ignore any errors below"
echo -e "..trying not to lose my grep on reality"
rm -Rf ~/greplab
mkdir ~/greplab
cp /scripts/work/words ~/greplab/
chown -R linuxuser:linuxuser ~/greplab
groupdel greplab &> /dev/null
groupadd greplab  &> /dev/null

echo -e "....All set\n\n Time for grepping!"

#!/bin/bash
# Set Up for Quiz
source /scripts/functions.sh
clear
is_super_user
echo -e "Setting up..."
rm -Rf ~/Quiz5
mkdir -p ~/Quiz5/basement/IT
mkdir -p ~/Quiz5/basement/office
cp /scripts/data/CanadaNationalParks.txt ~/Quiz5/parks.txt
chown -R linuxuser:linuxuser ~/Quiz5
echo -e "Done setting up."
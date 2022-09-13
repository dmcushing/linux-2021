#!/bin/bash

source /scripts/functions.sh
clear
is_super_user

rm -Rf ~/Postal
mkdir -p ~/Postal
PCODES=("K8B2G8" "T1Y7X5" "E7E1C1" "N1M5N7" "K6A3K9" "T1R2Y1" "J3E4J0" "T5A4L3" "J0L7X4" "J1T1J7" "H5A6M6" "H8Z7S9" "H4Z2K0" "P5E7G0" "E9B4A0" "H3C7E9" "K4C3V8" "A8A1M2" "G5H1J5" "A8A2J7" "E5G0B7" "J0N3B5" "S4A1H8" "J0M5R8" "P3A3V8")
echo -e "Generating Postal Codes..."
for PCODES in ${PCODES[*]}
do
	touch ~/Postal/$PCODES
done
echo -e "..Done"
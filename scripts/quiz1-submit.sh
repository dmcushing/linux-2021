#!/bin/bash

# QUIZ1 - Avengers Assemble

source /scripts/functions.sh

clear
student_info Quiz 1 - Avengers

#
# Check existence of files that should be deleted
#
echo -e "All these files should *NOT* exist *EXCEPT* for Loki" | tee -a $outfile

FILES=( "/home/linuxuser/Quiz1/Scene1/AlexisDenisof" "/home/linuxuser/Quiz1/Scene1/Loki" "/home/linuxuser/Quiz1/Scene1/Thor" "/home/linuxuser/Quiz1/Scene2/Hulk" "/home/linuxuser/Quiz1/Scene2/BlackWidow" "/home/linuxuser/Quiz1/Scene2/ClarkGregg" "/home/linuxuser/Quiz1/Scene2/ChrisEvans" "/home/linuxuser/Quiz1/Scene3/IronMan" "/home/linuxuser/Quiz1/Scene3/PepperPots" "/home/linuxuser/Quiz1/Scene3/Jarvis" "/home/linuxuser/Quiz1/AgentMariaHill" "/home/linuxuser/Quiz1/NickFury" )

for FILES in ${FILES[*]}
do
	check_existence - $FILES f
done
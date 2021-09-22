#!/bin/bash

# QUIZ1 - Avengers Assemble

source /scripts/functions.sh

clear
student_info Quiz 1 - Avengers

#
# Check existence of files that should be deleted
#
echo -e "All these files should *NOT* exist *EXCEPT* for Loki" | tee -a $outfile

FILES=( "~/Quiz1/Scene1/AlexisDenisof" "~/Quiz1/Scene1/Loki" "~/Quiz1/Scene1/Thor" "~/Quiz1/Scene2/Hulk" "~/Quiz1/Scene2/BlackWidow" "~/Quiz1/Scene2/ClarkGregg" "~/Quiz1/Scene2/ChrisEvans" "~/Quiz1/Scene3/IronMan" "~/Quiz1/Scene3/PepperPots" "~/Quiz1/Scene3/Jarvis" "~/Quiz1/AgentMariaHill" "~/Quiz1/NickFury" )

for FILES in ${FILES[*]}
do
	check_existence - $FILES f
done
#!/bin/bash
# Avengers file copy/remove/cat/nl

clear
echo -e "Avengers Assemble! (actually, just moving files around)"
rm -Rf ~/Quiz1
mkdir -p ~/Quiz1/Avengers/Actors
mkdir -p ~/Quiz1/Avengers/Characters
mkdir -p ~/Quiz1/SHIELD/Actors
mkdir -p ~/Quiz1/SHIELD/Characters
mkdir -p ~/Quiz1/BadGuys
mkdir -p ~/Quiz1/Scene1
mkdir -p ~/Quiz1/Scene2
mkdir -p ~/Quiz1/Scene3
sleep 2
echo -e "..Directories made"
echo -e "\nThe Other : The Tesseract has awakened. It is on a little world. A human world.\n\ncopy this file to the ~/Quiz1/BadGuys and delete the original file\n" > ~/Quiz1/Scene1/AlexisDenisof
echo -e "\nThor : Have a care how you speak! Loki is beyond reason, but he is of Asgard and he is my brother!\nNatasha Romanoff : He killed eighty people in two days.\nThor : He's adopted.\n\ncopy this file to ~/Quiz1/BadGuys and leave the original file\n" > ~/Quiz1/Scene1/Loki
echo -e "\nThor : I thought humans were more evolved than this.\nNick Fury : Excuse me, did WE come to YOUR planet and blow stuff up?\n\ncopy this file to ~/Quiz1/Avengers/Characters and delete the original file.\n" > ~/Quiz1/Scene1/Thor
echo -e "\nSteve Rogers : Doctor Banner, now might be a good time for you to get angry.\nBruce Banner : That's my secret, Captain: I'm always angry.\n\ncopy this file to ~/Quiz1/Avengers/Characters and delete the original file.\n" > ~/Quiz1/Scene2/Hulk
echo -e "\nNatasha Romanoff : [watching the aliens come toward them]  This is just like Budapest all over again.\nClint Barton : You and I remember Budapest very differently.\n\n\ncopy this file to ~Quiz1/Avengers/Characters and delete the original file.\n" > ~/Quiz1/Scene2/BlackWidow
echo -e "\nAgent Phil Coulson : You lack conviction.\n\n\ncopy this file to ~/Quiz1/SHIELD/Actors and delete the original file.\n" > ~/Quiz1/Scene2/ClarkGregg
echo -e "\nCaptain America : I got that reference.\n\n\ncopy this file to ~/Quiz1/Avengers/Actors and delete the original file.\n" > ~/Quiz1/Scene2/ChrisEvans
echo -e "\nSteve Rogers : Big man in a suit of armour. Take that off, what are you?\nTony Stark : Genius, billionaire, playboy, philanthropist.\n\n\ncopy this file to ~/Quiz1/Avengers/Characters and delete the original file.\n" > ~/Quiz1/Scene3/IronMan
echo -e "\nTony Stark : Apparently I'm volatile, self-obsessed, and don't play well with others.\nPepper Potts : That I did know.\n\n\ncopy this file to ~/Quiz1/Avengers/Characters and delete the original file.\n" > ~/Quiz1/Scene3/PepperPots
echo -e "\nIron Man : Yeah I got that - Plan B.\nJarvis : Sir, the Mark VII is not ready for deployment.\nIron Man : Then skip the spinning rims! We're on the clock!\n\n\ncopy this file to ~/Quiz1/Avengers/Characters and delete the original file.\n" > ~/Quiz1/Scene3/Jarvis
echo -e "\nMaria Hill : You put those people together, you can't expect what's going to happen..\n\ncopy this file to ~/Quiz1/SHIELD/Characters and delete the original file.\n" > ~/Quiz1/AgentMariaHill
echo -e "\nWorld Security Council : Director Fury, the council has made a decision.\nNick Fury : I recognise the council has made a decision, but given that it's a stupid-ass decision, I've elected to ignore it.\n\ncopy this file to ~/Quiz1/SHIELD/Characters and delete the original file.\n" > ~/Quiz1/NickFury
sleep 2
echo -e "......Avengers Assembled!"
echo -e "Your turn to save the world!! (or, you know, do the quiz)"
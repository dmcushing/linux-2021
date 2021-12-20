#!/bin/bash
# Avengers file copy/remove/cat/nl

clear
echo -e "Setting up the ghosts!"
rm -Rf ~/Pacman
mkdir -p ~/Pacman/1980s
mkdir -p ~/Pacman/Galaxian
mkdir -p ~/Pacman/SpaceInvaders
mkdir -p ~/Pacman/StarWars
mkdir -p ~/Pacman/BattleZone
mkdir -p ~/Pacman/Zaxxon
mkdir -p ~/Pacman/Defender
mkdir -p ~/Pacman/Arcade
echo -e "..Directories made"
touch ~/Pacman/1980s/BestArcadeGames
touch ~/Pacman/Galaxian/BigBoss
touch ~/Pacman/SpaceInvaders/DavesDebt
touch ~/Pacman/StarWars/ExhaustPipe
touch ~/Pacman/BattleZone/Vectortank
touch ~/Pacman/Zaxxon/Aliens
touch ~/Pacman/Defender/MoreAliens
touch ~/Pacman/Arcade/HomeAwayFromHome
cp /scripts/work/CLYDE.txt ~/Pacman
cp -R /scripts/work/aboynamed/ ~/Pacman/
cp -R /scripts/work/noname/ ~/Pacman/
cp -R /scripts/work/pac-man/ ~/Pacman/
cp -R /scripts/work/spooks/ ~/Pacman/
echo -e "....Files created"
echo -e "......Ghosts are here!"

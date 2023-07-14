#!/bin/bash
# Pacman

source /scripts/functions.sh
clear
is_super_user

echo -e "Chasing down the ghosts!"
rm -Rf ~/Pacman ~/quarantine
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
cp /scripts/data/pacman-lab/CLYDE.txt ~/Pacman
cp -R /scripts/data/pacman-lab/aboynamed/ ~/Pacman/
cp -R /scripts/data/pacman-lab//noname/ ~/Pacman/
cp -R /scripts/data/pacman-lab/pac-man/ ~/Pacman/
cp -R /scripts/data/pacman-lab/spooks/ ~/Pacman/
cp -R /scripts/data/pacman-lab/uptown/ ~/Pacman/
chown -R linuxuser:linuxuser ~/Pacman
echo -e "....Files created"
echo -e "......Ghosts are here!"

#!/bin/bash
# Potter Assignment

source /scripts/functions.sh

clear
is_super_user
student_info Diagon Lab

echo -e "Output of tree -pug ~/DiagonAlley" | tee -a $outfile

tree -pug ~/DiagonAlley | tee -a $outfile
blank_line

echo -e "Did you create the correct directories?" | tee -a $outfile
check_existence 1 ~/DiagonAlley/Beasts/ d
check_existence 1 ~/DiagonAlley/Lost+Found/ d
check_existence 1 ~/DiagonAlley/Potions/ d
check_existence 1 ~/DiagonAlley/Spells/ d

blank_line

echo -e "Did you find all the lost Diagon files?" | tee -a $outfile
check_existence 1 ~/DiagonAlley/Beasts/Diagon-Acromantula.txt f
check_existence 1 ~/DiagonAlley/Lost+Found/Diagon-ApearerbusDemonundo.txt f
check_existence 1 ~/DiagonAlley/Lost+Found/Diagon-Ashwinder.txt f
check_existence 1 ~/DiagonAlley/Lost+Found/Diagon-BrewOfWeakness.txt f
check_existence 1 ~/DiagonAlley/Lost+Found/Diagon-BriarToad.txt f
check_existence 1 ~/DiagonAlley/Lost+Found/Diagon-ElixirOfSteelskin.txt f
check_existence 1 ~/DiagonAlley/Lost+Found/Diagon-PhilterOfIntuition.txt f
check_existence 1 ~/DiagonAlley/Lost+Found/Diagon-PorenusAgoinio.txt f
check_existence 1 ~/DiagonAlley/Lost+Found/Diagon-SlugectoTorchigeo.txt f
blank_line

echo -e "Checking correct owners and groups" | tee -a $outfile
check_owner 1 ~/DiagonAlley/Beasts beastuser
check_group 1 ~/DiagonAlley/Beasts beasts
check_owner 1 ~/DiagonAlley/Potions potionuser
check_group 1 ~/DiagonAlley/Potions potions
check_owner 1 ~/DiagonAlley/Spells spelluser
check_group 1 ~/DiagonAlley/Spells spells
check_owner 1 ~/DiagonAlley/Lost+Found diagon
check_group 1 ~/DiagonAlley/Lost+Found lostfound
check_owner 1 ~/DiagonAlley/Lost+Found/Diagon-BriarToad.txt diagon
check_group 1 ~/DiagonAlley/Lost+Found/Diagon-BriarToad.txt lostfound
blank_line

echo -e "Checking correct permissions" | tee -a $outfile
check_permissions 1 ~/DiagonAlley/Beasts drwxr-x---
check_permissions 1 ~/DiagonAlley/Lost+Found drwxrwxrwx
check_permissions 1 ~/DiagonAlley/Lost+Found/Diagon-BriarToad.txt -rwxrwxrwx
check_permissions 1 ~/DiagonAlley/Potions drwxr-x---
check_permissions 1 ~/DiagonAlley/Spells drwxr-x---
blank_line

# Submit the work
mail_out Diagon Lab CET1025
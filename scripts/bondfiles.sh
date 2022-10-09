#!/bin/bash
#
source /scripts/functions.sh

clear
echo -e "***"
echo -e "***"
echo -e "***"
echo -e "*** RUN THIS WITHOUT SUDO"
echo -e "***"
echo -e "***"
echo -e "***"

# Create the directories
mkdir -p ~/bond/roger
mkdir -p ~/bond/pre80s/george
mkdir -p ~/bond/pre80s/sean
mkdir -p ~/bond/post80s/daniel
mkdir -p ~/bond/post80s/pierce
mkdir -p ~/bond/post80s/timothy
sudo chown -R linuxuser:linuxuser ~/bond

# Add the Groups
sudo groupadd bonds
sudo groupadd pre80s
sudo groupadd post80s

# Add the users
sudo useradd -m -G post80s,bonds -c "Daniel Craig" -s /bin/bash daniel
sudo useradd -m -G post80s,bonds -c "Timothy Dalton" -s /bin/bash timothy
sudo useradd -m -G post80s,bonds -c "Pierce Brosnan" -s /bin/bash pierce
sudo useradd -m -G post80s,bonds -c "Sean Connery" -s /bin/bash sean
sudo useradd -m -G post80s,bonds -c "George Lazenby" -s /bin/bash george
sudo useradd -m -G pre80s,post80s,bonds -c "Roger Moore" -s /bin/bash roger

# Create the file structure
seanFILES=(~/bond/pre80s/sean/drno-1962 ~/bond/pre80s/sean/fromrussiawithlove-1963 ~/bond/pre80s/sean/goldfinger-1964 ~/bond/pre80s/sean/thunderball-1965 ~/bond/pre80s/sean/youonlylivetwice-1967 ~/bond/pre80s/sean/diamondsareforever-1971)
georgeFILES=(~/bond/pre80s/george/onhermajestyssecretservice-1969)
pre80srogerFILES=(~/bond/roger/liveandletdie-1973 ~/bond/roger/manwiththegoldengun-1974 ~/bond/roger/spywholovedme-1977 ~/bond/roger/moonraker-1979)
post80srogerFILES=(~/bond/roger/foryoureyesonly-1981 ~/bond/roger/octopussy-1983 ~/bond/roger/aviewtoakill-1985) 
timothyFILES=(~/bond/post80s/timothy/livingdaylights-1987 ~/bond/post80s/timothy/licencetokill-1989)
pierceFILES=(~/bond/post80s/pierce/goldeneye-1995 ~/bond/post80s/pierce/tomorrowneverdies-1997 ~/bond/post80s/pierce/worldisnotenough-1999 ~/bond/post80s/pierce/dieanotherday-2002 ~/bond/post80s/pierce/script-run)
danielFILES=(~/bond/post80s/daniel/casinoroyale-2006 ~/bond/post80s/daniel/quantumofsolace-2008 ~/bond/post80s/daniel/skyfall-2012 ~/bond/post80s/daniel/spectre-2015 ~/bond/post80s/daniel/notimetodie-2021)

for seanFILES in ${seanFILES[*]}
do
	touch $seanFILES
	sudo chown sean:pre80s $seanFILES
	sudo chmod 660 $seanFILES
done
for georgeFILES in ${georgeFILES[*]}
do
	touch $georgeFILES
	sudo chown george:pre80s $georgeFILES
	sudo chmod 660 $georgeFILES
done
for pre80srogerFILES in ${pre80srogerFILES[*]}
do
	touch $pre80srogerFILES
	sudo chown roger:pre80s $pre80srogerFILES
	sudo chmod 660 $pre80srogerFILES
done
for post80srogerFILES in ${post80srogerFILES[*]}
do
	touch $post80srogerFILES
	sudo chown roger:post80s $post80srogerFILES
	sudo chmod 660 $post80srogerFILES
done
for timothyFILES in ${timothyFILES[*]}
do
	touch $timothyFILES
	sudo chown timothy:post80s $timothyFILES
	sudo chmod 660 $timothyFILES
done
for pierceFILES in ${pierceFILES[*]}
do
	touch $pierceFILES
	sudo chown pierce:post80s $pierceFILES
	sudo chmod 660 $pierceFILES
done
for danielFILES in ${danielFILES[*]}
do
	touch $danielFILES
	sudo chown daniel:post80s $danielFILES
	sudo chmod 660 $danielFILES
done

# Everything Else

ln -s ~/bond/roger ~/bond/pre80s/roger
ln -s ~/bond/roger ~/bond/post80s/roger

cp /scripts/themanwiththegoldengun.txt ~/bond/roger/
sudo chown roger:pre80s ~/bond/roger/themanwiththegoldengun.txt
sudo chmod 660 ~/bond/roger/themanwiththegoldengun.txt

grep -nw "Scaramanga" ~/bond/roger/themanwiththegoldengun.txt | nl > ~/bond/scaramanga.txt

find ~/bond -iname "*197?" | nl > ~/bond/70sflicks.txt

du -sh ~/bond > ~/bond/usedspace.txt
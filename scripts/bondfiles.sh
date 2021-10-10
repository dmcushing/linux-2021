#!/bin/bash
#
source /scripts/functions.sh

clear
is_super_user

# Create the home directories
mkdir -p /home/bond/pre80s
mkdir -p /home/bond/post80s
chown -R linuxuser:linuxuser /home/bond
chmod 755 /home/bond/pre80s /home/bond/post80s

# Add the Groups
groupadd bonds
groupadd pre80s
groupadd post80s

# Add the users
useradd -b /home/bond/post80s -m -G post80s,bonds -c "Daniel Craig" -s /bin/bash daniel
useradd -b /home/bond/post80s -m -G post80s,bonds -c "Timothy Dalton" -s /bin/bash timothy
useradd -b /home/bond/post80s -m -G post80s,bonds -c "Pierce Brosnan" -s /bin/bash pierce
useradd -b /home/bond/pre80s -m -G post80s,bonds -c "Sean Connery" -s /bin/bash sean
useradd -b /home/bond/pre80s -m -G post80s,bonds -c "George Lazenby" -s /bin/bash george
useradd -b /home/bond/ -m -G pre80s,post80s,bonds -c "Roger Moore" -s /bin/bash roger

# Create the file structure
seanFILES=("/home/bond/pre80s/sean/drno-1962" "/home/bond/pre80s/sean/fromrussiawithlove-1963" "/home/bond/pre80s/sean/goldfinger-1964" "/home/bond/pre80s/sean/thunderball-1965" "/home/bond/pre80s/sean/youonlylivetwice-1967" "/home/bond/pre80s/sean/diamondsareforever-1971")
georgeFILES=("/home/bond/pre80s/george/onhermajestyssecretservice-1969")
pre80srogerFILES=("/home/bond/roger/liveandletdie-1973" "/home/bond/roger/manwiththegoldengun-1974" "/home/bond/roger/spywholovedme-1977" "/home/bond/roger/moonraker-1979")
post80srogerFILES=("/home/bond/roger/foryoureyesonly-1981" "/home/bond/roger/octopussy-1983" "/home/bond/roger/aviewtoakill-1985") 
timothyFILES=("/home/bond/post80s/timothy/livingdaylights-1987" "/home/bond/post80s/timothy/licencetokill-1989")
pierceFILES=("/home/bond/post80s/pierce/goldeneye-1995" "/home/bond/post80s/pierce/tomorrowneverdies-1997" "/home/bond/post80s/pierce/worldisnotenough-1999" "/home/bond/post80s/pierce/dieanotherday-2002")
danielFILES=("/home/bond/post80s/daniel/casinoroyale-2006" "/home/bond/post80s/daniel/quantumofsolace-2008" "/home/bond/post80s/daniel/skyfall-2012" "/home/bond/post80s/daniel/spectre-2015" "/home/bond/post80s/daniel/notimetodie-2021")

for seanFILES in ${seanFILES[*]}
do
	touch $seanFILES
	chown sean:pre80s $seanFILES
	chmod 660 $seanFILES
done
for georgeFILES in ${georgeFILES[*]}
do
	touch $georgeFILES
	chown george:pre80s $georgeFILES
	chmod 660 $georgeFILES
done
for pre80srogerFILES in ${pre80srogerFILES[*]}
do
	touch $pre80srogerFILES
	chown roger:pre80s $pre80srogerFILES
	chmod 660 $pre80srogerFILES
done
for post80srogerFILES in ${post80srogerFILES[*]}
do
	touch $post80srogerFILES
	chown roger:post80s $post80srogerFILES
	chmod 660 $post80srogerFILES
done
for timothyFILES in ${timothyFILES[*]}
do
	touch $timothyFILES
	chown timothy:post80s $timothyFILES
	chmod 660 $timothyFILES
done
for pierceFILES in ${pierceFILES[*]}
do
	touch $pierceFILES
	chown pierce:post80s $pierceFILES
	chmod 660 $pierceFILES
done
for danielFILES in ${danielFILES[*]}
do
	touch $danielFILES
	chown daniel:post80s $danielFILES
	chmod 660 $danielFILES
done

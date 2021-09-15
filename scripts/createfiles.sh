#!/bin/bash
WORDS=`cat /usr/share/dict/words`
MY_HOME="./work/"
for counter1 in `seq 1 5`; do
	DIR1=$MY_HOME/`shuf -n1 /usr/share/dict/words`
	mkdir -p $DIR1
	shuf -n20 /usr/share/dict/words > $DIR1/`shuf -n1 /usr/share/dict/words`
	shuf -n20 /usr/share/dict/words > $MY_HOME/`shuf -n1 /usr/share/dict/words`
	random_dir=`shuf -i5-15 -n1`
	for counter2 in `seq 1 $random_dir`; do
		DIR2=$DIR1/`shuf -n1 /usr/share/dict/words`
		mkdir -p $DIR2
		shuf -n50 /usr/share/dict/words > $DIR2/`shuf -n1 /usr/share/dict/words`
		shuf -n50 /usr/share/dict/words > $DIR2/`shuf -n1 /usr/share/dict/words`
		another_random_dir=`shuf -i1-5 -n1`
		for counter3 in `seq 1 $another_random_dir`; do
			DIR3=$DIR2/`shuf -n1 /usr/share/dict/words`
			mkdir -p $DIR3
			shuf -n50 /usr/share/dict/words > $DIR3/`shuf -n1 /usr/share/dict/words`
			shuf -n50 /usr/share/dict/words > $DIR3/`shuf -n1 /usr/share/dict/words`
			shuf -n50 /usr/share/dict/words > $DIR3/`shuf -n1 /usr/share/dict/words`
		done
	done
done

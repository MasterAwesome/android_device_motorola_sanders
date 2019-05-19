#!/bin/sh

export Changelog=$PWD/Changelog.txt

if [ -z $CHGLOGDUR ];
then
    CHGLOGDUR="10"
fi

if [ $CHGLOGDUR -gt 30 ];
then
    echo "Duration greater than 30 is not allowed, resetting to 10"
    CHGLOGDUR="10"
fi

if [ -f $Changelog ]; 
then
	rm -f $Changelog
fi

touch $Changelog

echo "Generating changelog..."

for i in $(seq $CHGLOGDUR);
do
export After_Date=`date --date="$i days ago" +%m-%d-%Y`
k=$(expr $i - 1)
	export Until_Date=`date --date="$k days ago" +%m-%d-%Y`

	# Line with after --- until was too long for a small ListView
	echo '=======================' >> $Changelog;
	echo  "     "$Until_Date       >> $Changelog;
	echo '=======================' >> $Changelog;
	echo >> $Changelog;

	# Cycle through every repo to find commits between 2 dates
	repo forall -pc 'git log --oneline --after=$After_Date --until=$Until_Date' >> $Changelog
	echo >> $Changelog;
done

sed -i 's/project/   */g' $Changelog

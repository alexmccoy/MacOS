#!/bin/sh

prefix="/Users/"
for i in `dscl . -list /Users | grep -v '^_.*' | grep -iv daemon | grep -iv nobody | grep -iv admin`
do
	dscl . passwd $prefix$i Thisshitisbananas3!
	fdesetup remove --user $i
	if [ $? -eq 0 ]; then
    		echo $prefix$i" has been changed"
	else
    		echo "Error: "$?
	fi
done
shutdown -h now

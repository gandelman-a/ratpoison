#!/bin/bash

STRING1=$1
STRING2=$2

DIFF=$STRING2
for i in $STRING1 ; do
	DIFF=$(echo $DIFF | sed -e "s/$i/X/g")
done


DIFF=$(echo $DIFF | sed -e 's/X/ /g')
echo $DIFF
 

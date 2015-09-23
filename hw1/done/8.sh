#!/bin/bash
if [ -f "$1" ]
then
	sort -u -R < $1 | nl
else
	echo "Input file $1 not found."
fi

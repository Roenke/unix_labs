#!/bin/bash
if [ -f "$1" ]
then
	factor < $1 > $2
else
	echo "File $1 not found."
fi

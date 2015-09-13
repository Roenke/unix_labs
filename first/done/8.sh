#!/bin/bash
if [ -f "$1" ]
then
	sort -u -R < $1 | nl
else
	echo "File $1 not found."
fi

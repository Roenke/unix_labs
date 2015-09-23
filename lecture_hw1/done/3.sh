#!/bin/bash
# ascii only
# file=../tests/3/names.csv
if [ -f "$1" ] ;then
	sed -r -e '1 i\<!DOCTYPE html><html><head></head><body><table border="3">' \
	-e  's/([A-Za-z]+),([A-Za-z]+),([0-9\(\)-]+)/<tr><td>\1<\/td> <td>\2<\/td> <td>\3<\/td><\/tr>/' \
	-e '$ a </table></body></html>' "$1" > contacts.html
	firefox ./contacts.html
	exit 0	
else
	echo "Usage ./3.sh filename"
	exit 1
fi


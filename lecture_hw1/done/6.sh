#!/bin/bash
# file=../tests/4/main.cpp
if [ -f "$1" ] ;then
	cat "$1" | sed -r -e '/#include*/ d' -e '/.*".*".*/ !d' -e 's/.*"(.*)".*/\1/g'
else
	echo "Usage ./6.sh filename"
fi 

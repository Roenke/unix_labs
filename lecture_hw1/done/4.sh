#!/bin/bash
# file=../tests/4/main.cpp
if [ -f "$1" ] ;then
	cat -- "$1" | grep "^\s*#include*" | sed -r -e 's/(.*)[<|"](.*)[>|"](.*)/\2/'
else
	echo "Usage ./6.sh filename"
fi 

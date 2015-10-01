#!/bin/bash
# Usage ./17.sh &
while :
do
	ps -e -o %cpu,%pid --sort %cpu | tail -n 1
	sleep 5s
done
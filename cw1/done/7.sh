#!/bin/bash
author=$(head -n 1 $1)
count=$(head -n 2 $1 | tail -n 1)
let "p=$RANDOM % $count"
let "p+=2"
quote=$(cat "$1" | tr '\n' ' ' | cut -d "*" -f "$p")
echo ${quote:3}
echo "$author"

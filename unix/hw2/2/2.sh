#!/bin/bash

edge="|"
plus="+"
node="o"
function get_line {
	local level=$1
	if (( level == 0 )); then
		echo "|"
		echo "o"
		return
	fi
	let 'next_level=level - 1'
	local nexts=$(get_line $next_level)
	
	spaces_count=$(echo "2^($level + 1) - 2" | bc)
	spaces=$(head -c "$spaces_count" /dev/zero | tr '\0' ' ')
	line1="$spaces$edge$spaces"

	spaces_count=$(echo "2^($level) - 2" | bc)
	minuses_count=$(echo "2^($level) - 1" | bc)
	spaces=$(head -c $spaces_count /dev/zero | tr '\0' ' ')
	minuses=$(head -c $minuses_count /dev/zero | tr '\0' '-')
	prefix="$spaces$plus$minuses"
	postfix=$(echo "$prefix" | rev)
	line2="$prefix$node$postfix"

	echo "$line1"
	echo "$line2"

	IFS=''
	echo "$nexts" | while read line ; do
		echo "$line   $line"
	done
}
if(( $1 == 0 )); then
	echo ""
	exit 0
fi
let "n=$1 - 1"
get_line $n
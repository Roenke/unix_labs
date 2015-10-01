#!/bin/bash
# Usage; ./18.sh rings_count
# Даны три стержня, на один из которых нанизаны 
# восемь колец, причем кольца отличаются 
# размером и лежат меньшее на большем.
function moveTower {
	echo "From: $1 to $2"
}

function moveDisk {
	if (( $1 >= 1 )) ; then
		moveDisk "$(($1-1))" $2 $4 $3
		moveTower $2 $3
		moveDisk "$(($1-1))" $4 $3 $2
	fi
}

moveDisk $1 "a" "b" "c"

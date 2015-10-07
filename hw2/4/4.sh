#!/bin/bash
# Украшаем find

find | while read name ; do
	if [ $name == "." ]; then
		echo "$name"
		continue
	fi
	base_name=$(basename "$name")
	dir_name=$(dirname "$name")
	count=$(echo "$dir_name" | tr -cd "/" | wc -c)
	((count=2 * $count + 1))
	deep=$(head -c $count < /dev/zero | tr '\0' '-')
	echo "|$deep$base_name"
done
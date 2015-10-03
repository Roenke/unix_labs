#!/bin/bash

level="0"
find_results=$(find ./ -mindepth "$level" -maxdepth "$level" )

if [[ -z "${find_results// }" ]]; then
	continue_flag=false
else
	continue_flag=true
fi
while $continue_flag ; do
	echo "$find_results" | xargs -I x basename x | sort
	((++level))
	find_results=$(find ./ -mindepth "$level" -maxdepth "$level" )
	if ! [[ -z "${find_results// }" ]]; then
		echo ""
	else
		continue_flag=false
	fi
done
#!/bin/bash

partitions_raw=$(sudo dd if=/dev/sda bs=2 count=32 skip=223 2>/dev/null | hexdump -v -e '/1 "%02x "')
i=0
bytes=()
for word in $partitions_raw;
do
	bytes[$i]="$word"
	((++i))
done

partition_start_offset=0
partition_type_offset=4
partitions_offset=16
partitions_count=0
i=0

while (( i < 4 )); 
do
	first_byte=${bytes[$partition_start_offset]}
	if (( $first_byte == 0 )) || (( $first_byte == 80 )); then
		if (( $first_byte != 0 )); then
		 	((++partition_count))
		fi
		type_hex_code=${bytes[$partition_type_offset]}
		type_name=$(grep -iE "^$type_hex_code" types.txt | cut -c 4- |sed -e 's/^[ \t]*//')
		echo "Found partition $i: $type_name"
	fi
	let "partition_start_offset+=partitions_offset"
	let "partition_type_offset+=partitions_offset"
	((++i))
done

echo "Not empty count (NOT 00h in first byte): $partition_count"

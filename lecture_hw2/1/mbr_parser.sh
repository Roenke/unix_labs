#!/bin/bash

hex_partitions=$(sudo dd if=/dev/sda bs=512 count=1 | hexdump -v -s 446 -n 64 -e '/1 "%02x "')
i=0
partition_bytes=()
for hb in $hex_partitions;
do
	partition_bytes[$i]="$hb"
	((i++))
done

partition_count=0
partition_starts=(0 16 32 48)
partition_types=(4 20 36 52)
pretty_result=""
for i in $(seq 0 3)
do
	start=${partition_starts[$i]}
	tp=${partition_types[$i]}
	if (( ${partition_bytes[$start]} == 00 )) || (( ${partition_bytes[$start]} == 80 ))
	then
		if (( ${partition_bytes[$tp]} != 00 ))
		then
			((++partition_count))
			# case "${partition_bytes[$tp]}" in
			# 	82) pretty_result="$pretty_result\n$i partition: Linux swap";;
			# 	83) pretty_result="$pretty_result\n$i partition: Linux";;
			# 	63) pretty_result="$pretty_result\n$i partition: UNIX";;
			# 	ee) pretty_result="$pretty_result\n$i partition: GPT";;
			# 	0b) pretty_result="$pretty_result\n$i partition: FAT-32";;
			# 	*) pretty_result="$pretty_result\n$i partition: UNKNOWN";;
			# esac
		fi
	fi
done

printf "Found %d partitions:\n" $partition_count
# printf $pretty_result

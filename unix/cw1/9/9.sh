#!/bin/bash
total=0
for file in ./*; do
    if [ -d "$file" ]; then
        continue
    fi
    file_size=$(stat --printf "%s" "$file")
    total=$(( total + file_size ))
done 

file_size=$(stat --printf "%s" "$0")
result=$(( total - file_size ))
echo "$result"
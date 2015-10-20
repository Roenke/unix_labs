#!/bin/bash

if [[ "$1" != "-d" ]] && [[ "$1" != "--date" ]]; then
    echo "Wrong argument."
    echo "Usage:" 
    echo "      ./14.sh -d"
    echo "      ./14.sh --date"
    exit 1
fi

while [ 1 ];
do
    date_time=$(date)
    symbols=$(echo "$date_time" | wc -c)
    echo -n "$date_time"
    sleep 1
    head -c "$symbols" /dev/zero | tr '\0' '\b'
done
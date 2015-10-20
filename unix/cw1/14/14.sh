#!/bin/bash

need_date=0
if [[ "$1" = "-d" ]] || [[ "$1" = "--date" ]]; then
    need_date=1
fi

while [ 1 ];
do
    if (( need_date == 1 ));then
        date_time=$(date "+%x - %X")
    else
        date_time=$(date "+%X")
    fi
    
    symbols=$(echo "$date_time"  | wc -c)
    echo -n "$date_time"
    sleep 1
    head -c "$symbols" /dev/zero | tr '\0' '\b'
done

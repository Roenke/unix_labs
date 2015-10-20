#!/bin/bash

ch_before_ch=$(head -c 1 "$1")
ch_after_ch=$(head -c 1 "$2")
ch_before=$(printf '%d' "'$ch_before_ch")
ch_after=$(printf '%d' "'$ch_after_ch")
result=$(( ch_after - ch_before ))

if (( result < 0 ));then
    (( result += 256 ))
fi

echo "$result"
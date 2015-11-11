#!/bin/bash
# Southern Hemisphere mode
# How-to. Turn over your screen. Enjoy

default_snow="./default_snow"
snow_file="./snow"
buf="./buf"
power=8
cat "$default_snow" > "$snow_file"
: > "$buf"

cols=$(tput cols)
lines=$(tput lines)

while [ 1 ];
do
    cols=$(tput cols)
    lines=$(tput lines)
    symbols=$(( cols * lines ))
    : > "$buf"
    head -c "$cols" /dev/urandom | while read -n 1 num;  do
        d=$(printf '%d' "'$num")
        if (( $d % $power == 0 )); then
            echo -n "*" >> buf
        else
            echo -n " " >> buf
        fi
    done 

    line=$(cat "$buf")
    echo "$line"
    ((--lines))
    old=$(head -n "$lines" "$snow_file")
    echo "$old"
    echo "$line" > "$snow_file"
    echo "$old" >> "$snow_file"
    sleep 0.1
done

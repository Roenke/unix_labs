#!/bin/bash
# Southern Hemisphere mode
# How-to. Turn over your screen. Enjoy

power=4


while [ 1 ];
do
    cols=$(tput cols)
    lines=$(tput lines)
    symbols=$(( cols * lines ))
    head -c "$cols" /dev/urandom | while read -n 1 num
    do
        d=$(printf '%d' "'$num")
        if (( $d % $power == 0 )); then
            echo -n "*"
        else
            echo -n " "
        fi
    done
done
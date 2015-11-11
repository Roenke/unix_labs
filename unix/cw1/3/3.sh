#/bin/bash
date1="[0-9]{2}\.[0-9]{2}\.[0-9]{2}"
date2="[0-9]{2}\.[0-9]{2}\.[0-9]{4}"
date3="[0-9]{2}\/[0-9]{2}\/[0-9]{2}"
date4="[0-9]{2}\/[0-9]{2}\/[0-9]{4}"
date5="[0-9]{4}\/[0-9]{2}\/[0-9]{2}"
date_regex="($date1|$date2|$date3|$date4|$date5)"

time1="[0-9]{2}:[0-9]{2}"
time2="$time1:[0-9]{2}"
time_regex="($time1|$time2)"
spaces="\s+"
or="|"
total_regex="^($time_regex$spaces$date_regex)$or($date_regex$spaces$time_regex)$"

read input_string

echo "$input_string" | grep -oP "$total_regex"

#!/bin/bash
base_file="./base_file"
touch base_file
total_lines=$(wc -l "$base_file")
tmp_file=$(mktemp ./temp.XXXX)
case "$1" in
 "push_back" )
    echo "$2" >> "$base_file"
 ;;

 "push_front" )
    
    cat "$base_file" > "$tmp_file"
    echo "$2" > "$base_file"
    cat "$tmp_file" >> "$base_file"
 ;;

 "pop_back" )
    if (( total_lines = 0 )); then
        rm "$tmp_file"
        exit 1
    fi
    result=$(tail -n 1 "$base_file")
    new_size=$((total_lines - 1))
    head -n "$new_size" "$base_file" > "$tmp_file"
    cat "$tmp_file" > "$base_file"
    echo "$result"
 ;;

 "pop_front" )
    if (( total_lines = 0 )); then
        rm "$tmp_file"
        exit 1
    fi
    result=$(head -n 1 "$base_file")
    cat "$base_file" | sed -e '1d' > "$tmp_file"
    cat "$tmp_file" > "$base_file"
    echo "$result"
 ;;

esac

#!/bin/bash
temp_file="$(mktemp /tmp/task_9_cw1.XXXXXXXXXX)"
base64 "$1" > "$temp_file"
cat "$temp_file" > "$1"
rm "$temp_file"
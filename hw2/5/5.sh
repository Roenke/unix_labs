#!/bin/bash

# запускает таску в cron
tmp_name="./__tmp__"
dir_name=$(pwd)
filename="checker.sh"
cron_task="*/1 * * * * bash $dir_name/$filename"

touch "$tmp_name"
crontab -l > "$tmp_name"
echo "$cron_task" >> "$tmp_name"
crontab "$tmp_name"

rm "$tmp_name"

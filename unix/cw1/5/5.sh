#!/bin/bash

content=$(wget -O /dev/stdout "https://api.vk.com/method/photos.get?owner_id=19378260&album_id=220701819&rev=1&extended=0&photo_sizes=0&v=5.37&fields=online" 2>/dev/null)
count=$(echo "$content" | jq ".response.count")

i=0
while (( i < count )); do
    photo_2560=$(echo "$content" | jq ".response.items[$i].photo_2560")
    if [[ "$photo_2560" != "null" ]] ;then
        echo "$photo_2560"
    else
        photo_1280=$(echo "$content" | jq ".response.items[$i].photo_1280")
        echo "$photo_1280"
    fi
    ((++i))
done

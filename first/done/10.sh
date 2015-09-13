#!/bin/bash

function check {
    parsed=$(wget -O /dev/stdout 'https://api.vk.com/method/users.get?user_id=347745&v=5.37&fields=online' 2>/dev/null | grep -Po '"online":\d')
    online='"online":1'
    if [ "$parsed" == "$online" ] ; then
        new_state="1"
    else 
        new_state="0"
    fi
}

check
state=$new_state
state_description["0"]="offline"
state_description["1"]="online"

while :
do
    check
    echo "old = $state, new = $new_state" > /dev/stderr
    if [ "$new_state" != "$state" ] ; then
        state=$new_state
        description=${state_description[$state]}
        wall "Anton Kuznetsov is $description"
        echo "State changed. Current is $description" > /dev/stderr
	fi
	sleep 1m
done
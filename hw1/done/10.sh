#!/bin/bash

function check {
    parsed=$(wget -O /dev/stdout 'https://api.vk.com/method/users.get?user_id=8758515&v=5.37&fields=online' 2>/dev/null | grep -Po '"online":\d')
    if [[ '"online":1' == "$parsed" ]] ; then
        new_state=1
    else 
        new_state=0
    fi
}

check
state=$new_state
state_description[0]="offline"
state_description[1]="online"

while :
do
    check
    echo "old = $state, new = $new_state" > /dev/stderr
    if (( new_state != state )) ; then
        state=$new_state
        echo "Anton Kuznetsov is ${state_description[$state]}" | wall 
        echo "State changed. Current is ${state_description[$state]}" > /dev/stderr
    fi
    sleep 1m
done

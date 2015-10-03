#!/bin/bash
# amid  347745
# myid  8758515

log_file="/var/log/spy_bibaev.log"
state_file="/var/run/state.state"
function log {
    echo "[$(date +%d-%m-%Y" "%H:%M:%S)] $1" >> "$log_file"
}

function check {
    parsed=$(wget -O /dev/stdout 'https://api.vk.com/method/users.get?user_id=347745&v=5.37&fields=online' 2>/dev/null | grep -Po '"online":\d')
    if [[ '"online":1' == "$parsed" ]] ; then
        echo "online"
    else 
        echo "offline"
    fi
}

old_state=$(cat "$state_file")

new_state=$(check)

if [ "$new_state" != "$old_state" ] ;then
	log "Status changed ($new_state)" 
    echo "Status changed! Now: $new_state" | wall
    echo "$new_state" > "$state_file"
else
    log 'Checked. Status not changed ($new_state)'
fi

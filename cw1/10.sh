#/bin/bash
# $1 - year yyyy
# $2 - month mm
# $3 - number nn
cal -N -m $2 $1 -H $1-$2-$3 | grep '_\b' | tr ' ' '\n' | head -n 1
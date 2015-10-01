#!/bin/bash
# Usage ./2.sh filename
grep -iE "([_-\.a-z0-9]+).(mp3|wav|ogg)$" "$1"
#!/bin/bash
# Распознавать MAC-адрес короче, чем было написано в презентации.
# ^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$
# file=../tests/1/macs
if [ -f "$1" ] ;then
	cat --  | grep -w -i -P "^([a-f\d]{2}(:|$)){6}"
else
	echo "Usage ./1.sh filename"
fi
#!/bin/bash

cat "$1" | grep -ioP "([\.,-_0-9a-z]*[a-z][\.,-_0-9a-z]*)@([a-z]+\.)+[a-z]+" | sort | uniq -c | sort -r | cut -c 9-

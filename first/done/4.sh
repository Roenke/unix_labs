#!/bin/bash
# file="../test_hist"
file=~/.bash_history

cat "$file" | tr '|;&' '\n' | column -t | grep -E "^$1" | wc -l

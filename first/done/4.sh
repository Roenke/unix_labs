#!/bin/bash
cat ~/.bash_history | tr '|;&' '\n' | grep $1 | wc -l
